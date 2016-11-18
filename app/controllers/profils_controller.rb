class ProfilsController < ApplicationController
  before_action :set_profil, only: [ :show, :edit, :update, :destroy ]
  def new
    @profil = Profil.new
  end

  def create
    @profil = Profil.new(profil_params)
    @profil.user = current_user
    if @profil.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comics = current_user.comics
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
    params.require(:profil).permit(:first_name, :last_name, :address, :city)
  end

end
