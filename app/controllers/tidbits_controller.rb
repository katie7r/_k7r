class TidbitsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @tidbit = Tidbit.new
  end

  def create
    tidbit = Tidbit.new
    if params[:tidbit]
      tidbit.title     = params[:tidbit][:title]
      tidbit.type      = params[:tidbit][:type]
      tidbit.content   = params[:tidbit][:content]
      tidbit.more_info = params[:tidbit][:more_info]
      tidbit.author_id = current_admin.id
      tidbit.save!
    end

    if current_admin && tidbit.save!
      flash_message = { succsess: 'Tidbit successfully created.' }
    else
      flash_message = { error: 'SOMETHING WENT TERRIBLY WRONG.' }
    end
    redirect_to tidbits_path, flash: flash_message
  end

  def edit
    @tidbit = Tidbit.find params[:id]
  end

  def update
  end

  def destroy
  end
end
