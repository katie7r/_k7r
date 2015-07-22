class StaticController < ApplicationController
  layout 'home', only: :home

  def home
  end

  def about
  end

  def portfolio
  end

  # def resume
  # end
end
