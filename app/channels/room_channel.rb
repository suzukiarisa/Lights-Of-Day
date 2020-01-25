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
  	@message = Message.new content: data['message'], to_id: data['to_id'], from_id: data['from_id'], room_id: data['room_id']
    @message.save!
  	ActionCable.server.broadcast 'room_channel', @message
  end
end
