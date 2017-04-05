require 'net/http'
require 'fileutils'

class Cameras
 

  @@camera = {
    'Basement_ipcam' => { 'Host' => "SC5CEB7A",  ## CHANGE
        'Port' => "80",  ## CHANGE
        'Username' => 'admin', ## CHANGE
        'Password' => '', ## CHANGE
        'URL' => "/img/snapshot.cgi",
        'newFile' => "assets/images/cameras/snapshot1_new.jpeg",
        'oldFile' => "assets/images/cameras/snapshot1_old.jpeg",
        'type' => 'http' },

      'QSEE' => {         'Host' => "10.200.1.225",  ## CHANGE
         'Port' => "443",  ## CHANGE
         'Username' => 'None', ## CHANGE
         'Password' => '', ## CHANGE
         'URL' => "/zm/cgi-bin/nph-zms?mode=single&monitor=7&scale=100&maxfps=1&buffer=1000",
         'newFile' => "assets/images/cameras/snapshot3_new.jpeg",
         'oldFile' => "assets/images/cameras/snapshot3_old.jpeg",
        'type' => 'http' },

     'FrontPorch_FF_ipcam' => { 'Host' => "merilille",  ## CHANGE
        'Port' => "80",  ## CHANGE
        'Username' => 'None', ## CHANGE
        'Password' => '', ## CHANGE
        'URL' => "/zm/cgi-bin/nph-zms?mode=single&monitor=1&scale=100&maxfps=1&buffer=1000",
        'newFile' => "assets/images/cameras/snapshot3_new.jpeg",
        'oldFile' => "assets/images/cameras/snapshot3_old.jpeg",
        'type' => 'http' },
     'Frontporch2' => { 'Host' => "10.200.1.225",  ## CHANGE
        'Port' => "443",  ## CHANGE
        'Username' => 'None', ## CHANGE
        'Password' => '', ## CHANGE
        'URL' => "/zm/cgi-bin/nph-zms?mode=single&monitor=8&scale=100&maxfps=1&buffer=1000",
        'newFile' => "assets/images/cameras/snapshot3_new.jpeg",
        'oldFile' => "assets/images/cameras/snapshot3_old.jpeg",
        'type' => 'http' },

     'blink' => { 'Host' => "merilille",  ## CHANGE
        'Port' => "80",  ## CHANGE
        'Username' => 'None', ## CHANGE
        'Password' => '', ## CHANGE
        'URL' => "/zm/cgi-bin/nph-zms?mode=single&monitor=5&scale=100&maxfps=1&buffer=1000",
        'newFile' => "assets/images/cameras/snapshot3_new.jpeg",
        'oldFile' => "assets/images/cameras/snapshot3_old.jpeg",
        'type' => 'http' },

     'BackPorch_FF_ipcam' => { 'Host' => "merilille",  ## CHANGE
        'Port' => "80",  ## CHANGE
        'Username' => 'None', ## CHANGE
        'Password' => '', ## CHANGE
        'URL' => "/zm/cgi-bin/nph-zms?mode=single&monitor=2&scale=100&maxfps=1&buffer=1000",
        'newFile' => "assets/images/cameras/snapshot4_new.jpeg",
        'oldFile' => "assets/images/cameras/snapshot4_old.jpeg",
        'type' => 'http' },

     'Garage_ipcam' => { 'Host' => "merilille",  ## CHANGE
        'Port' => "80",  ## CHANGE
        'Username' => 'None', ## CHANGE
        'Password' => '', ## CHANGE
        'URL' => "/zm/cgi-bin/nph-zms?mode=single&monitor=3&scale=100&maxfps=1&buffer=1000",
        'newFile' => "assets/images/cameras/snapshot4_new.jpeg",
        'oldFile' => "assets/images/cameras/snapshot4_old.jpeg",
        'type' => 'http' },

      'cubie' => {         'Host' => "cubieboard",  ## CHANGE
         'Port' => "80",  ## CHANGE
         'Username' => 'admin', ## CHANGE
         'Password' => 'admin', ## CHANGE
         'URL' => "/cgi-bin/nph-mjgrab?1",
         'newFile' => "assets/images/cameras/snapshot3_new.jpeg",
         'oldFile' => "assets/images/cameras/snapshot3_old.jpeg",
        'type' => 'http' },
     'Frontroom_FF_ipcam' => { 'Host' => "SC5CEB79",  ## CHANGE
        'Port' => "80",  ## CHANGE
        'Username' => 'None', ## CHANGE
        'Password' => '', ## CHANGE
        'URL' => "/img/snapshot.cgi",
        'newFile' => "assets/images/cameras/snapshot2_new.jpeg",
        'oldFile' => "assets/images/cameras/snapshot2_old.jpeg",
        'type' => 'http' },

      'foscam' => {         'Host' => "10.200.1.63",  ## CHANGE
         'Port' => "80",  ## CHANGE
         'Username' => 'admin', ## CHANGE
         'Password' => 'lokimoki', ## CHANGE
         'URL' => "/snapshot.cgi?user=admin",
         'newFile' => "assets/images/cameras/snapshot3_new.jpeg",
         'oldFile' => "assets/images/cameras/snapshot3_old.jpeg",
        'type' => 'http' },

#      'blink' => {         'Host' => "10.200.1.137",  ## CHANGE
#         'Port' => "80",  ## CHANGE
#         'Username' => 'admin', ## CHANGE
#         'Password' => 'lokimoki', ## CHANGE
#         'URL' => "/?action=snapshot",
#         'newFile' => "assets/images/cameras/snapshot3_new.jpeg",
#         'oldFile' => "assets/images/cameras/snapshot3_old.jpeg",
#        'type' => 'http' },

#      'Frontporch2' => {         'Host' => "10.200.1.239",  ## CHANGE
#         'Port' => "554",  ## CHANGE
#         'Username' => 'admin', ## CHANGE
#         'Password' => 'lokimoki', ## CHANGE
#         'URL' => "/live0.264",
#         'newFile' => "assets/images/cameras/snapshot3_new.jpeg",
#         'oldFile' => "assets/images/cameras/snapshot3_old.jpeg",
#        'type' => 'rtsp' },


#'' => {         'Host' => "cctv_server",  ## CHANGE
#         'Port' => "80",  ## CHANGE
#         'Username' => 'None', ## CHANGE
#         'Password' => '', ## CHANGE
#         'URL' => "/mobile/channel03.jpg",
#         'newFile' => "assets/images/cameras/snapshot4_new.jpeg",
#         'oldFile' => "assets/images/cameras/snapshot4_old.jpeg"},

#'' => {         'Host' => "cctv_server",  ## CHANGE
#         'Port' => "80",  ## CHANGE
#         'Username' => 'None', ## CHANGE
#         'Password' => '', ## CHANGE
#         'URL' => "/mobile/channel04.jpg",
#         'newFile' => "assets/images/cameras/snapshot5_new.jpeg",
#         'oldFile' => "assets/images/cameras/snapshot5_old.jpeg"}
  }
  def get_newFile_name(cam)
      @@camera[cam]['newFile'] 
  end
  def get_keys()
      @@camera.keys 
  end
  def get_oldFile_name(cam)
      @@camera[cam]['oldFile'] 
  end
  def fetch_image(cam)

#	puts 'DEBUG '+cam
	old_file = @@camera[cam]['oldFile']
#        `pwd`
#        `ls -la #{old_file}`
#	`rm #{old_file}` 
#	new_file = @@camera[cam]['newFile']
        if File.exist?(old_file)
           FileUtils.rm(old_file)
        else
           puts old_file+" doesn't exist"
        end
        begin
         if (@@camera[cam]['type'] == 'http')
           Net::HTTP.start(@@camera[cam]['Host'],@@camera[cam]['Port'], :use_ssl => (@@camera[cam]['Port'] == '443'), :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
		req = Net::HTTP::Get.new(@@camera[cam]['URL'])
		if @@camera[cam]['Username'] != "None" ## if username for any particular camera is set to 'None' then assume auth not required.
			req.basic_auth @@camera[cam]['Username'], @@camera[cam]['Password']
		end
		response = http.request(req)
                if response.code == "200" and response.body.size > 0
                    @@camera[cam]['oldFile'] = @@camera[cam]['newFile']
                    @@camera[cam]['newFile'] = "assets/images/cameras/"+cam+".jpg"
                    open(@@camera[cam]['newFile'], "wb") do |file|
			file.write(response.body)
                    end
                else 
                   warn "Unable to get "+cam
		end
           end
         else
            cmd = "avconv -y -i rtsp://"+@@camera[cam]['Host']+":" +@@camera[cam]['Port'] +@@camera[cam]['URL']+ " -loglevel panic -vframes 1 "+ @@camera[cam]['newFile'] 
            puts cmd
            `#{cmd}`
         end
        rescue StandardError => bang
          print "Error downloading ",@@camera[cam],bang
        end
#		puts 'DEBUG '+cam+":"+new_file
	new_file = @@camera[cam]['newFile']
	new_file
  end
 
  def make_web_friendly(file)

    ret =  "/" + File.basename(File.dirname(file)) + "/" + File.basename(file) 
#    puts ret
    ret
  end
 
end
