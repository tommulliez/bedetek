class ComicsController < ApplicationController
  before_action :set_comic, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @comics = Comic.all
  end

  def show

    @booking = Booking.new

  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)
    @comic.user = current_user if current_user


    if @comic.save

      redirect_to comic_path(@comic)
    else
      render :new
    end
  end

  def edit
  end


  def update
    if @comic.update(comic_params)
      redirect_to comic_path(@comic)
    else
      render :new
    end
  end

  def destroy
    @comic.destroy
    redirect_to comics_path
  end

  private

  def set_comic
    @comic = Comic.find(params[:id])
  end

  def comic_params
    params.require(:comic).permit(:title, :editor, :artist, :price, :genre, :state, :year, :description, :photo, :photo_cache)
  end

end
