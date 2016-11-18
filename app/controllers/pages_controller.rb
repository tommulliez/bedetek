class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: [:home]
  def home
    @comics = Comic.all

  end
end
