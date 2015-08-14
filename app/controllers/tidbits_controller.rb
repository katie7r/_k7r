class TidbitsController < ApplicationController
  before_filter :restrict_to_admin, :load_tidbit, only: [:edit, :update]

  def index
    @tidbit_totals = Tidbit.get_totals

    @category = Tidbit.has_category?(params[:category]) ? params[:category] : 'all'

    if @category != 'all'
      @tidbits = Tidbit.with_category(@category).in_order
    else
      @tidbtis = Tidbit.in_order
    end

    if current_admin && params[:unpublished]
      @tidbits = @tidbits.unpublished
    end
  end

  def new
    @tidbit = Tidbit.new
  end

  def create
    @tidbit = current_admin.tidbits.build(tidbit_params)
    if @tidbit.save!
      flash[:success] = 'Thanks for submitting a tidbit!'
      redirect_to tidbits_path and return
    else
      flash.now[:error] = 'There was an issue creating the tidbit.'
      render :new and return
    end
  end

  def edit
  end

  def update
    if @tidbit.update_attributes!(tidbit_params)
      flash[:success] = 'Tidbit successfully updated.'
      redirect_to tidbits_path and return
    else
      flash.now[:error] = 'There was an issue updating the tidbit.'
      render :edit and return
    end
  end

  private

  def load_tidbit
    @tidbit = Tidbit.find(params[:id])
  end

  def tidbit_params
    params.require(:tidbit).permit(:category, :content, :more_info, :more_info_link, :title)
  end
end
