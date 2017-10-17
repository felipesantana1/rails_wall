class CommentsController < ApplicationController

    def create
        comment = Comment.new(content:params[:comment], user:User.find(session[:id]), message:Message.find(params[:message_id]))
        if comment.valid?
            comment.save
            redirect_to '/messages'
        else
            flash[:errors] = comment.errors.full_messages
            redirect_to '/messages'
        end
    end
end
