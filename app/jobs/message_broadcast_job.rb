class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
  	if message.user_id.nil?
      # オールチャット用のブロードキャスト　宛先がない場合はroom_channelにストリームされる。
  	  ActionCable.server.broadcast 'room_channel', message: render_message(message)
    # Do something later
    else
      # 宛先を指定した場合のストリーム　ルームチャンネルの語尾にユーザIDが付与され、ブロードキャストされる
      # 送る相手にストリーム
      ActionCable.server.broadcast "room_channel#{message.user_id}",message: render_message(message)
      # 自分にストリーム
      ActionCable.server.broadcast "room_channel#{message.userid}",message: render_message(message)
    end
  end

private
  def render_message(message)
	  ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
