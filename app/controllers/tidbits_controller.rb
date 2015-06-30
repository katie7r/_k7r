class TidbitsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @tidbit = Tidbit.new
  end

  def create
  end

  def edit
    @tidbit = Tidbit.find params[:id]
  end

  def update
  end

  def destroy
  end
end
