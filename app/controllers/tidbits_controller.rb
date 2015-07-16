class TidbitsController < ApplicationController
  before_filter :restrict_to_admin, except: [:index]
  before_filter :load_tidbit, only: [:edit, :update]

  def index
    if params[:category] && Tidbit.categories.keys.include?(params[:category])
      @category = params[:category]
      @tidbits  = Tidbit.with_category(@category).in_order
    else
      @category = 'All'
      @tidbits  = Tidbit.in_order
    end
  end

  def new
    @tidbit = Tidbit.new
  end

  def create
    @tidbit = current_admin.tidbits.build(tidbit_params)
    if @tidbit.save!
      flash[:success] = 'Tidbit successfully created.'
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
    params.require(:tidbit).permit(:tidbit_type, :title, :content, :more_info, :more_info_link)
  end
end
