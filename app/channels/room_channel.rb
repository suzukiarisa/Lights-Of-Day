class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def talk(data)
  	Message.create!(content: data['message'])
  	ActionCable.server.broadcast 'room_channel', data[])

  end
end
