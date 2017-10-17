class UsersController < ApplicationController

  def index
  end

  def create
    @user = User.find_by_username(params[:username]).try(:authenticate, params[:password])
    if @user
      session[:id] = @user.id
      redirect_to '/messages'
    else
      @user = User.new(username:params[:username], password:params[:password])
      if @user.valid?
        @user.save
        session[:id] = @user.id
        redirect_to '/messages'
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to '/users/index'
      end
    end
  end

  def logout
    session.clear
    redirect_to '/users/index'
  end

end
