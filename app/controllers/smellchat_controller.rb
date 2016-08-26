class SmellchatController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def main
    @messages = Message.all.reverse
    @name = params[:name]
  end

  def create
    Message.create(message_params)
    redirect_to "/?name=#{message_params[:author]}"
  end

  def message_params
    params.require(:message).permit(:author, :content)
  end
end
