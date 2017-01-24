class Dashing.Stream extends Dashing.ClickableWidget
  ready: ->
    debugger
    $(@node).removeClass('widget')
    color = $(@node).data("color")
    $.get '/camera/1',
      host: '10.200.1.160'
      port: 80
      path: '/'
      method: 'GET'
      headers: req.headers
      (data) =>
        json = JSON.parse data
        @set 'state', json.state


#  onData: (data) ->
#    $(@node).find(".iframe").attr('src', data.src)

