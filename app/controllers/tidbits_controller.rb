class TidbitsController < ApplicationController
  before_filter :restrict_to_admin, except: [:index, :show]

  def index
    @tidbits = Tidbit.all
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
    @tidbit = Tidbit.find params[:id]
  end

  def update
  end

  def destroy
  end

  private

  def tidbit_params
    params.require(:tidbit).permit(:tidbit_type, :title, :content, :more_info, :more_info_link)
  end
end
