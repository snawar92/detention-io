class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @link = Link.new
  end

  def index
    @link = Link.all

    respond_to do |format|
      format.html
      format.csv { send_data @link.to_csv, :filename => 'Placements.csv' }
      format.xls
    end
  end


  def create
    @user = current_user
    @link = @user.links.new(link_params)
    if @link.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if @link.update(link_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @link = Link.find(params[:id])

    if @link.user == current_user
      @link.destroy
      redirect_to root_path
    end
  end

  def upvote
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_back fallback_location: root_path
  end

  def downvote
    @link = Link.find(params[:id])
    @link.downvote_by current_user
    redirect_back fallback_location: root_path
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end

end
