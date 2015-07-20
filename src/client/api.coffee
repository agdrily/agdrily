window.agdrily =
  apiVersion: 0
  apiURL: '/api/0'

  worldMap: (cb) ->
    $.getJSON("#{@apiURL}/world_map", cb)
