class TicketsController < ApplicationController
  before_action :get_ticket, only: [:show, :edit, :update, :destroy]
  def index
    @tickets = Ticket.all
    @project_names = Project.all.map{|project| project[:title]}
  end

  def create # TODO: fix tags and assignee
    form_inputs = ticket_params
    form_inputs[:status] = params[:status]
    # form_inputs[:tags] = params[:tags]
    # form_inputs[:assignee] = params[:assignee]
    @ticket = Ticket.new(form_inputs)
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
    params.require(:ticket).permit(:title, :body, :project_id)
  end

  def get_ticket
    @ticket = Ticket.find(params[:id])
  end
end
