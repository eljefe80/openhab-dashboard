require 'dashing'

configure do
  set :auth_token, 'openH4b'
  set :default_dashboard, 'dashboard/default'

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

set :assets_prefix, '/dashboard/assets'
map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Rack::URLMap.new('/dashboard' => Sinatra::Application)
