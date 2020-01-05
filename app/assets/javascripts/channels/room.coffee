App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log("received")
    $('#messages').append "<li>"+data['message']+"</li>"
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    console.log("speak")
    @perform 'speak', message: message, user_id:$('#user_id').text()

  $(document).on 'keypress', '#chat-input', (event) ->
   console.log("-------")
   if event.keyCode is 13 # return = send
     console.log("++++++++++")
     App.room.speak event.target.value
     event.target.value = ''
     event.preventDefault()