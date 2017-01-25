require 'net/http'


class Cameras
 

  @@camera = {
    'Basement_ipcam' => { 'Host' => "10.200.1.160",  ## CHANGE
        'Port' => "80",  ## CHANGE
        'Username' => 'admin', ## CHANGE
        'Password' => '', ## CHANGE
        'URL' => "/img/snapshot.cgi",
        'newFile' => "assets/images/cameras/snapshot1_new.jpeg",
        'oldFile' => "assets/images/cameras/snapshot1_old.jpeg",
        'type' => 'http' },

      'QSEE' => {         'Host' => "10.200.1.62",  ## CHANGE
         'Port' => "85",  ## CHANGE
         'Username' => 'admin', ## CHANGE
         'Password' => 'admin', ## CHANGE
         'URL' => "/cgi-bin/snapshot.cgi?loginuse=admin&loginpas=admin",
         'newFile' => "assets/images/cameras/snapshot3_new.jpeg",
         'oldFile' => "assets/images/cameras/snapshot3_old.jpeg",
        'type' => 'http' },

     'FrontPorch_FF_ipcam' => { 'Host' => "10.200.1.159",  ## CHANGE
        'Port' => "80",  ## CHANGE
        'Username' => 'None', ## CHANGE
        'Password' => '', ## CHANGE
        'URL' => "/zm/cgi-bin/nph-zms?mode=single&monitor=1&scale=100&maxfps=1&buffer=1000",
        'newFile' => "assets/images/cameras/snapshot3_new.jpeg",
        'oldFile' => "assets/images/cameras/snapshot3_old.jpeg",
        'type' => 'http' },
     'Frontporch2' => { 'Host' => "10.200.1.159",  ## CHANGE
        'Port' => "80",  ## CHANGE
        'Username' => 'None', ## CHANGE
        'Password' => '', ## CHANGE
        'URL' => "/zm/cgi-bin/nph-zms?mode=single&monitor=4&scale=100&maxfps=1&buffer=1000",
        'newFile' => "assets/images/cameras/snapshot3_new.jpeg",
        'oldFile' => "assets/images/cameras/snapshot3_old.jpeg",
        'type' => 'http' },

     'blink' => { 'Host' => "10.200.1.159",  ## CHANGE
        'Port' => "80",  ## CHANGE
        'Username' => 'None', ## CHANGE
        'Password' => '', ## CHANGE
        'URL' => "/zm/cgi-bin/nph-zms?mode=single&monitor=5&scale=100&maxfps=1&buffer=1000",
        'newFile' => "assets/images/cameras/snapshot3_new.jpeg",
        'oldFile' => "assets/images/cameras/snapshot3_old.jpeg",
        'type' => 'http' },

     'BackPorch_FF_ipcam' => { 'Host' => "10.200.1.159",  ## CHANGE
        'Port' => "80",  ## CHANGE
        'Username' => 'None', ## CHANGE
        'Password' => '', ## CHANGE
        'URL' => "/zm/cgi-bin/nph-zms?mode=single&monitor=2&scale=100&maxfps=1&buffer=1000",
        'newFile' => "assets/images/cameras/snapshot4_new.jpeg",
        'oldFile' => "assets/images/cameras/snapshot4_old.jpeg",
        'type' => 'http' },

     'Garage_ipcam' => { 'Host' => "10.200.1.159",  ## CHANGE
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
     'Frontroom_FF_ipcam' => { 'Host' => "10.200.1.175",  ## CHANGE
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
	@@camera[cam]['oldFile'] = @@camera[cam]['newFile']
#	new_file = @@camera[cam]['newFile']
	`mv #{old_file} assets/images/cameras/new/`	
	@@camera[cam]['newFile'] = "assets/images/cameras/"+cam+Time.now.to_i.to_s+".jpg"
	new_file = @@camera[cam]['newFile']
        begin
         if (@@camera[cam]['type'] == 'http')
           Net::HTTP.start(@@camera[cam]['Host'],@@camera[cam]['Port']) do |http|
		req = Net::HTTP::Get.new(@@camera[cam]['URL'])
		if @@camera[cam]['Username'] != "None" ## if username for any particular camera is set to 'None' then assume auth not required.
			req.basic_auth @@camera[cam]['Username'], @@camera[cam]['Password']
		end
		response = http.request(req)
#                puts cam
		open(@@camera[cam]['newFile'], "wb") do |file|
			file.write(response.body)
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
	new_file
  end
 
  def make_web_friendly(file)

    ret =  "/" + File.basename(File.dirname(file)) + "/" + File.basename(file) 
#    puts ret
    ret
  end
 
end