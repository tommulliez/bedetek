class ProfilsController < ApplicationController
  before_action :set_profil, only: [ :show, :edit, :update, :destroy ]
  def new
    @profil = Profil.new
  end

  def create
    @profil = Profil.new(profil_params)
    @profil.user_id = current_user.id if current_user

    if @profil.save

      redirect_to comics_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @profil.update(profil_params)
      redirect_to profil_path(@profil)
    else
      render :new
    end
  end

  private

  def set_profil
    @profil = Profil.find(params[:id])
  end

  def profil_params
    params.require(:profil).permit(:first_name, :last_name, :address, :country, :city, :photo, :photo_cache)
  end

end
