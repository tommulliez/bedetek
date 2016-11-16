class PagesController < ApplicationController

  def home
    @comics = Comic.all
  end
end
