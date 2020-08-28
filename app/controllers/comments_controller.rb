class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :edit, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.creator = current_user
    @comment.ticket_id = params[:ticket_id]
    if @comment.save
      ticket = @comment.ticket
      ticket.status = params[:ticket_status] if params[:ticket_status] != ""
      ticket.save
      flash[:notice] = "Your comment was successfully created"
      redirect_to @comment.ticket
    else
      render ticket_path(params[:ticket_id])
    end
  end

  def update
    if @comment.update(comment_params)
      if params[:status] != ""
        ticket = @comment.ticket
        ticket.status = params[:status]
        ticket.save
      end
      flash[:notice] = "Your comment was successfully updated"
      redirect_to @comment.ticket
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @comment.destroy
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def require_same_user
    if current_user != @comment.creator
      flash[:alert] = "You can only edit or delete your own comment"
      redirect_to @comment.ticket
    end
  end
end
