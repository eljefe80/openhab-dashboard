require 'net/https'
require 'json'

class Stream

  # openHAB REST call
  def getCamera(host, port, path, method, headers)
    boundary="BoundaryString"
    http = Net::HTTP.new(host, port)
    http.use_ssl = false
    headers = {'Content-Type' => 'multipart/x-mixed-replace;boundary="' + boundary + '"',
        'Connection' => 'close',
        'Pragma' => 'no-cache',
        'Cache-Control' => 'no-cache, private',
        'Expires' => 0,
        'Max-Age' => 0,}
    code = http.head(path, headers).code.to_i
    if (code >= 200 && code < 300) then

    #the data is available...
     http.get(uri.path, headers) do |chunk|
        #provided the data is good, print it...
        print chunk unless chunk =~ />416.+Range/
    end
  end
end

end
