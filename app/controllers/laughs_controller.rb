class LaughsController < ApplicationController
  before_filter :restrict_to_admin, except: [:index]
  before_action :set_laugh, only: [:edit, :update]

  def index
    @unpublished = params[:unpublished] && current_admin
    @laughs = @unpublished ? Laugh.unpublished : Laugh.published
  end

  def new
    @laugh = Laugh.new
  end

  def create
    @laugh = Laugh.new(laugh_params)
    if @laugh.save!
      flash[:success] = 'Laugh successfully created.'
      redirect_to laugh_redirect and return
    else
      flash.now[:error] = 'There was an issue creating the laugh.'
      render :new and return
    end
  end

  def edit
  end

  def update
    if @laugh.update(laugh_params)
      flash[:success] = 'Laugh successfully updated.'
      redirect_to laugh_redirect and return
    else
      flash.now[:error] = 'There was an issue updating the laugh.'
      render :edit and return
    end
  end

  private
    def set_laugh
      @laugh = Laugh.find(params[:id])
    end

    def laugh_params
      params.require(:laugh).permit(:content, :followup, :published, :setup, :source_link)
    end

    def laugh_redirect
      @laugh.published? ? laughs_path : unpublished_laughs_path
    end
end
