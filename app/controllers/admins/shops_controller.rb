class Admins::ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
  end

  def edit
  end

  def update
  end
end
