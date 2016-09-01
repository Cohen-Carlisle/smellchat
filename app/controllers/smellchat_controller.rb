class SmellchatController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def main
    @messages = Message.order('created_at DESC')
  end

  def create
    message = Message.create!(message_params)
    ActionCable.server.broadcast('messages',
                                 content: message_params[:content],
                                 author: message_params[:author])
    cookies[:username] = {
      value: message_params[:author],
      expires: 1.year.from_now
    }
    redirect_to "/"
  end

  def message_params
    params.require(:message).permit(:author, :content)
  end
end
