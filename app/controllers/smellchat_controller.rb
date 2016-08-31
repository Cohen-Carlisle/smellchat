class SmellchatController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def main
    @messages = Message.all.reverse
  end

  def create
    Message.create(message_params)
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
