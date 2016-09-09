class MessageController < ApplicationController
  def all
    @messages = Message.order('created_at DESC')
  end

  def create
    message = Message.new(message_params)
    if message.save
      ActionCable.server.broadcast('messages',
                                   content: message.content,
                                   author: message.author)
      cookies.permanent[:username] = message.author
    end
  end

  def message_params
    params.require(:message).permit(:author, :content)
  end
end
