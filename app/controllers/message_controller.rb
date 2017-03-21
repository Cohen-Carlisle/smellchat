class MessageController < ApplicationController
  FIELDS = %i(author content).freeze

  def all
    @messages = Message.select(FIELDS).order('created_at DESC')
  end

  def create
    sleep 1
    message = Message.new(message_params)
    if message.save
      ActionCable.server.broadcast('messages', message.slice(*FIELDS))
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
