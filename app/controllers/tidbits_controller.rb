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
    @tidbit = Tidbit.new

    if params[:tidbit]
      @tidbit.title          = params[:tidbit][:title]
      @tidbit.tidbit_type    = params[:tidbit][:tidbit_type]
      @tidbit.content        = params[:tidbit][:content]
      @tidbit.more_info      = params[:tidbit][:more_info]
      @tidbit.more_info_link = params[:tidbit][:more_info_link]
      @tidbit.author_id      = current_admin.id

      # begin
      #   @tidbit.save!
      # rescue
      # else
      #   flash[:success] = 'Tidbit successfully created.'
      #   return redirect_to tidbits_path
      # else
      #   flash_error = 'Could not save tidbit.'
      # end
    else
    end

    flash.now[:error] = 'SOMETHING WENT TERRIBLY, HORRIBLY WRONG: ' + flash_error.downcase
    return render :new
  end

  def edit
    @tidbit = Tidbit.find params[:id]
  end

  def update
  end

  def destroy
  end
end
