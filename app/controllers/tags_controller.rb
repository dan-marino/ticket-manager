class TagsController < ApplicationController
  before_action :get_tag, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]

  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag was successfully created."
      redirect_to @tag
    else
      render 'new'
    end
  end

  def new
    @tag = Tag.new()
  end

  def edit
  end

  def show
    @tickets = @tag.tickets
  end

  def update
    if @tag.update(tag_params)
      flash[:notice] = "Tag was successfully created."
      redirect_to @tag
    else
      render 'new'
    end
  end

  def destroy
    @tag.destroy
    flash[:notice] = "'#{@tag.title}' was deleted."
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:title, :description)
  end

  def get_tag
    @tag = Tag.find(params[:id])
  end

  def capitalize_tag
    params[:title].capitalize!
  end
end
