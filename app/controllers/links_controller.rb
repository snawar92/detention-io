class LinksController < ApplicationController

  def new
  	@link = Link.new
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

  

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end

end
