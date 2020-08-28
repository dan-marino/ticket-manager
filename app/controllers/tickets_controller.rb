class TicketsController < ApplicationController
  before_action :get_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]

  def index
    @tickets = Ticket.all
    @project_names = Project.all.map{|project| project[:title]}
  end

  def create # TODO: fix tags and assignee
    @ticket = Ticket.new(ticket_params)
    @ticket.status = params[:status]
    # @ticket.assignee_id = params[:assignee_id]
    @ticket.user_id = current_user.id
    byebug
    if @ticket.save
      flash[:notice] = "Ticket was successfully created."
      redirect_to @ticket
    else
      render 'new'
    end
  end

  def new
    # @statuses = ["new", "blocked", "in_progress", "fixed"]
    @ticket = Ticket.new()
  end

  def edit
  end

  def show
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket was successfully created."
      redirect_to @ticket
    else
      render 'new'
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "'#{@ticket.title}' was deleted."
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :body, :project_id, :assignee_id, tag_ids: [])
  end

  def get_ticket
    @ticket = Ticket.find(params[:id])
  end
end
