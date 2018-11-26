class CatsController < ApplicationController
  before_action :set_cat, only: %i[show edit update]
  before_action :require_login, only: [:create]

  def index
    @cats = Cat.order('created_at DESC')
  end

  def show; end

  def new
    @cat = Cat.new
  end

  def edit; end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cats_path
    else
      render :new
    end
  end

  def update
    if @cat.update_attributes(cat_params)
      redirect_to cat_path(@cat)
    else
      render :edit
    end
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:title, :body, :image, :image_cache)
  end
end
