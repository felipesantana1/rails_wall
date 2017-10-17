class MessagesController < ApplicationController

  def messages
    @user = User.find(session[:id])
    @messages = Message.all
    @comments = Comment.all
  end

  def create
    message = Message.new(content:params[:message], user:User.find(session[:id]))
    if message.valid?
      message.save
      redirect_to '/messages'
    else
      flash[:errors] = message.errors.full_messages
      redirect_to '/messages'
    end
  end

end
