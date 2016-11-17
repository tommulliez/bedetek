class ComicsController < ApplicationController
  before_action :set_comic, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @comics = Comic.all
    @profils = Profil.where.not(latitude: nil, longitude: nil)
    @profils_list = Profil.near(params[:location],30)

    if @profils_list == []
      @hash = Gmaps4rails.build_markers(@profils) do |profil, marker|
      marker.lat profil.latitude
      marker.lng profil.longitude
      end
    else
    @hash = Gmaps4rails.build_markers(@profils_list) do |profil, marker|
      marker.lat profil.latitude
      marker.lng profil.longitude
      end
    end
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
