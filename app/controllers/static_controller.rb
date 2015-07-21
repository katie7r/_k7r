class StaticController < ApplicationController
  layout "landing", only: :home

  def home
  end

  def about
  end

  def portfolio
  end

  # def resume
  # end
end
