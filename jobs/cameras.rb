require 'net/http'
require 'pathname'

cam = Cameras.new()
CAMERADELAY = 1 # Needed for image sync. 
FETCHNEWIMAGEEVERY = '3s'


get '/cameras/refresh' do
  new_file = cam.fetch_image(params['camera'])
  send_event(params['camera'], image: cam.make_web_friendly(new_file))
end

SCHEDULER.every '1h', first_in: 0 do
 files = Dir.foreach("assets/images/cameras/").select { |x| File.file?("assets/images/cameras/#{x}") }
 files.each do |file|
   path
   FileUtils.mv("assets/images/cameras/" + file, "assets/images/cameras/new" + file)
 end
end
 
 
SCHEDULER.every FETCHNEWIMAGEEVERY, first_in: 0 do
#	new_file1 = fetch_image(0)#@camera1Host,@oldFile1,@newFile1,@camera1Port,@camera1Username,@camera1Password,@camera1URL)
#	new_file2 = fetch_image(1)#@camera2Host,@oldFile2,@newFile2,@camera2Port,@camera2Username,@camera2Password,@camera2URL)
#	new_file3 = fetch_image(@camera3Host,@oldFile3,@newFile3,@camera3Port,@camera3Username,@camera3Password,@camera3URL)
#	new_file4 = fetch_image(@camera4Host,@oldFile4,@newFile4,@camera4Port,@camera4Username,@camera4Password,@camera4URL)
#	new_file5 = fetch_image(@camera5Host,@oldFile5,@newFile5,@camera5Port,@camera5Username,@camera5Password,@camera5URL)

        cam.get_keys().each do |key|
          new_file = cam.fetch_image(key)
	  if not File.exists?(cam.get_newFile_name(key)) # && @newFile2 && @newFile3)
	    warn "Failed to Get Camera Images"
	  end
 
#	  send_event(key, image: cam.make_web_friendly(cam.get_oldFile_name(key)))
#	send_event('camera3', image: make_web_friendly(@oldFile3))
#	send_event('camera4', image: make_web_friendly(@oldFile4))
#	send_event('camera5', image: make_web_friendly(@oldFile5))
#          sleep(CAMERADELAY)
#          puts cam.make_web_friendly(new_file)
          send_event(key, image: cam.make_web_friendly(new_file))
        end
#	send_event('camera3', image: make_web_friendly(new_file3))
#	send_event('camera4', image: make_web_friendly(new_file4))
#	send_event('camera5', image: make_web_friendly(new_file5))
#	send_event('camTest', image: make_web_friendly(new_file5))
end
