class Publics::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
  end
end
