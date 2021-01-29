class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new 
  end

  def create 
    @message = Message.new(text: params[:message][:text])
    if @message.save
      ActionCable.sever.broadcast 'message_chanel', content: @message
    end 
  end 
end
