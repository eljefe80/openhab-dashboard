#!/usr/bin/env ruby

require 'tempfile'
require 'optparse'
require 'rtsp/client'
require 'rtp/receiver'

optparse = OptionParser.new do |opts|
  opts.banner = "Usage: #{__FILE__} [options] url"

  #----------------------------------------------------------------------------
  # Turn on logging
  RTSP::Client.configure { |c| c.log = false }
  opts.on('-d', '--debug', "Turn on RTSP::Client logging.") do
    RTSP::Client.log = true
  end

  #----------------------------------------------------------------------------
  # Get description
  opts.on('--describe [URL]', "Get description from the given URL.") do |url|
    if url.nil?
      puts "Must pass in a URL."
      exit
    end

    rtsp_client = RTSP::Client.new(url)
    puts rtsp_client.describe.body.inspect
    exit
  end

  #----------------------------------------------------------------------------
  # Get options
  opts.on('--options [URL]', "Get options from the given URL.") do |url|
    if url.nil?
      puts "Must pass in a URL."
      exit
    end

    rtsp_client = RTSP::Client.new(url)
    puts rtsp_client.options.body.inspect
    exit
  end

  #----------------------------------------------------------------------------
  # Show available tracks
  opts.on('--show-tracks [URL]', "Show available tracks from the given URL.") do |url|
    if url.nil?
      puts "Must pass in a URL."
      exit
    end

    rtsp_client = RTSP::Client.new(url)
    rtsp_client.describe
    puts "Aggregate control track: #{rtsp_client.aggregate_control_track}"
    puts "Media control tracks: #{rtsp_client.media_control_tracks}"
    exit
  end

  #----------------------------------------------------------------------------
  # Stream
  opts.on('--stream [URL]', "Pull the first media stream from the given URL.") do |url|
    if url.nil?
      puts "Must pass in a URL."
      exit
    end

    rtsp_client = RTSP::Client.new(url)
    rtsp_client.capturer = RTP::Receiver.new(capture_file:
      File.open("#{Dir.pwd}/rtsp_client_stream.rtp", "wb"))

    begin
      puts "Getting server options..."
      response = rtsp_client.options
      puts "\tSupported methods:  #{response.public}"
      puts ""

      puts "Getting description..."
      response = rtsp_client.describe
      puts "\tcache_control:  #{response.cache_control}" if response.respond_to? "cache_control"
      puts "\tdate:           #{response.date}"
      puts "\texpires:        #{response.expires}" if response.respond_to? "expires"
      puts "\tcontent_type:   #{response.content_type}"
      puts "\tcontent_base:   #{response.content_base}"
      puts "\tAggregate control track: #{rtsp_client.aggregate_control_track}"
      puts "\tMedia control tracks: #{rtsp_client.media_control_tracks}"
      puts ""

      puts "Setting up #{rtsp_client.media_control_tracks.first}"
      response = rtsp_client.setup rtsp_client.media_control_tracks.first
      puts "\ttransport:      #{response.transport}"
      puts ""

      if response.message == "OK"
        puts "Playing #{rtsp_client.aggregate_control_track}"
        r = rtsp_client.play rtsp_client.aggregate_control_track
        puts "\trange:          #{r.range}"
        puts "\trtp_info:       #{r.rtp_info}"
        puts ""


        1...5.times do
          print "."
          sleep 1
        end
        puts ""

        if rtsp_client.capturer.capture_file.size.zero?
          puts "Captured 0 bytes.  Your firewall might be blocking the RTP traffic on port #{rtsp_client.capturer.rtp_port}."
        else
          puts "RTP data captured to file: #{rtsp_client.capturer.capture_file.path}"
        end

        puts "Tearing down..."
        r2 = rtsp_client.teardown(rtsp_client.aggregate_control_track)
        puts "\tconnection:     #{r2.connection}" if r2.respond_to? "connection"
      else
        puts "Play call returned: #{response.message}.  Exiting."
        exit
      end
    rescue RTSP::Error => ex
      puts ex.backtrace
      puts ex.message
    end
  end

  #----------------------------------------------------------------------------
  # Help
  opts.on('--version', "The version of the Ruby RTSP gem used for this.") do
    puts RTSP::VERSION
    exit
  end

  #----------------------------------------------------------------------------
  # Help
  opts.on('-h', '--help', "You're looking at it.") do
    puts opts
    exit
  end
end

if ARGV.size.zero?
  puts optparse.help if ARGV.size.zero?
  exit
end
optparse.parse!
