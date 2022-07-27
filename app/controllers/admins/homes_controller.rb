class Admins::HomesController < ApplicationController
  def top
    flash[:notice] = "Signed in successfully."
  end
end
