class MessageController < ApplicationController
  def all
    @messages = Message.order('created_at DESC')
  end

  def create
    sleep 1
    message = Message.new(message_params)
    if message.save
      ActionCable.server.broadcast('messages', message.slice(:author, :content))
      cookies.permanent[:username] = message.author
      head :ok
    else
      head :bad_request
    end
  end

  def message_params
    params.require(:message).permit(:author, :content)
  end
end
