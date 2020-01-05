class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    p "---------"
    p data['message']
  	Message.create! content: data['message'], user_id: data['user_id']
  	ActionCable.server.broadcast 'room_channel', message: data['message']
  end
end
