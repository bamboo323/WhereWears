class Publics::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @shops = Shop.all
  end
end
