class CatsController < ApplicationController
  def index
    @cats = Cat.order('created_at DESC')
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cats_path
    else
      render :new
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_path(@cat)
    else
      render :edit
    end
  end

  def destroy; end

  private

  def cat_params
    params.require(:cat).permit(:title, :body, :image, :image_cache, :remove_image)
  end
end
