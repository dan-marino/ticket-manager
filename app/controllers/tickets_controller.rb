class TicketsController < ApplicationController
  before_action :get_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]

  def index
    @tickets = filter(Ticket.all)
    @project_names = Project.all.map{|project| project[:title]}
  end

  def create # TODO: switch user_id to creator
    @ticket = Ticket.new(ticket_params)
    @ticket.status = params[:status]
    @ticket.user_id = current_user.id
    if @ticket.save
      flash[:notice] = "Ticket was successfully created."
      redirect_to @ticket
    else
      render 'new'
    end
  end

  def new
    @ticket = Ticket.new()
  end

  def edit
  end

  def show
    @comment = Comment.new
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

  def filter(tickets)
    tag_id = params[:tag]
    project_id = params[:project]
    status = params[:status]
    return tickets if !tag_id && !project_id && !status
    tickets.select do |ticket|
      (tag_id.length == 0 || ticket.tags.map { |tag| tag.id.to_s }.include?(tag_id)) &&
      (project_id.length == 0 || ticket.project_id.to_s == project_id) &&
      (status.length == 0 || ticket.status == status)
    end
  end
end
