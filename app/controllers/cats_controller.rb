class CatsController < ApplicationController

  def index
    @cats = Cat.order('created_at DESC')
  end

  def show
  end

  def new
    @cat = Cat.new
  end

  def edit
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
    if @cat.update_attributes(cat_params)
      redirect_to cat_path(@cat)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def cat_params
    params.require(:cat).permit(:title, :body, :image)
  end

end
