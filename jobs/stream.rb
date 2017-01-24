require 'json'

# URI to the installed app root

app = Stream.new()

get '/camera/1' do
  app.getCamera(params['host'],params['port'],params['path'],params['method'],params['headers'])
end

