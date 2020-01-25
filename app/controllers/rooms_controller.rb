class RoomsController < ApplicationController
  def show
  	@message = Message.new
  	@to_user = User.find(params[:to])
  	@room_id = message_room_id(current_user, @to_user)
  	@messages = Message.where(room_id: @room_id)
  	# @from_messages = current_user.from_messages
  	# @from_messages = current_user.from_messages
  	# @to_messages = current_user.to_messages
  end

  def create
    @message = Message.new(message_params)
    @message.save
  end

private

  def message_params
	params.require(:message).permit(:content, :from_id, :to_id, :room_id)
  end

  def message_room_id(first_user, second_user)
    first_id = first_user.id.to_i
    second_id = second_user.id.to_i
    if first_id < second_id
      "#{first_user.id}-#{second_user.id}"
    else
      "#{second_user.id}-#{first_user.id}"
    end
  end
end
