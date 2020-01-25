App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    fromId = $('#messages').data('from-id')
    console.log(fromId)
    side = if fromId == data.from_id then 'right_side' else 'left_side'
    $('#messages').append "<li class='" + side + "'>" + data['content'] + "</li>"
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    console.log("speak")
    @perform 'speak', message: message, from_id:$('#message_from_id').val(), to_id:$('#message_to_id').val(), room_id:$('#message_room_id').val()

  $(document).on 'keypress', '#chat-input', (event) ->
   console.log("-------")
   if event.keyCode is 13 # return = send
     console.log("++++++++++")
     App.room.speak event.target.value
     event.target.value = ''
     event.preventDefault()