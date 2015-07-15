class TidbitsController < ApplicationController
  before_filter :restrict_to_admin, except: [:index, :show]
  before_filter :load_tidbit, only: [:edit, :update, :show]

  def index
    @tidbits = Tidbit.in_order
  end

  def show
  end

  def new
    @tidbit = Tidbit.new
  end

  def create
    @tidbit = current_admin.tidbits.build(tidbit_params)
    if @tidbit.save!
      flash[:success] = 'Tidbit successfully created.'
      return redirect_to tidbits_path
    else
      flash.now[:error] = 'There was an issue creating the tidbit.'
      return render :new
    end
  end

  def edit
  end

  def update
    if @tidbit.update_attributes!(tidbit_params)
      flash[:success] = 'Tidbit successfully updated.'
      return redirect_to tidbits_path
    else
      flash.now[:error] = 'There was an issue updating the tidbit.'
      return render :edit
    end
  end

  def destroy
  end

  private

  def load_tidbit
    @tidbit = Tidbit.find params[:id]
  end

  def tidbit_params
    params.require(:tidbit).permit(:tidbit_type, :title, :content, :more_info, :more_info_link)
  end
end
