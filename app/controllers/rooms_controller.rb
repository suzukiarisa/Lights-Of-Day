class RoomsController < ApplicationController
  def show
  	@message = Message.new
  end

  def create
    @message = Message.new
  end

end
