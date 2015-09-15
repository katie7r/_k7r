class TidbitsController < ApplicationController
  before_filter :restrict_to_admin, except: [:index]
  before_filter :set_tidbit, only: [:edit, :update]

  def index
    @unpublished = params[:unpublished] && current_admin

    tidbits = @unpublished ? Tidbit.unpublished : Tidbit.published
    @tidbit_totals = tidbits.get_totals

    if params[:category] && Tidbit.categories.keys.include?(params[:category])
      @category = params[:category]
      tidbits   = tidbits.with_category(@category)
    else
      @category = 'all'
    end

    @tidbits = tidbits.in_order
  end

  def new
    @tidbit = Tidbit.new
  end

  def create
    @tidbit = current_admin.tidbits.build(tidbit_params)
    if @tidbit.save!
      flash[:success] = 'Tidbit successfully created.'
      redirect_to tidbit_redirect and return
    else
      flash.now[:error] = 'There was an issue creating the tidbit.'
      render :new and return
    end
  end

  def edit
  end

  def update
    if @tidbit.update(tidbit_params)
      flash[:success] = 'Tidbit successfully updated.'
      redirect_to tidbit_redirect and return
    else
      flash.now[:error] = 'There was an issue updating the tidbit.'
      render :edit and return
    end
  end

  private

  def set_tidbit
    @tidbit = Tidbit.find(params[:id])
  end

  def tidbit_params
    params.require(:tidbit).permit(:category, :content, :more_info, :more_info_link, :published, :title)
  end

  def tidbit_redirect
    @tidbit.published? ? tidbits_path : unpublished_tidbits_path
  end

end
