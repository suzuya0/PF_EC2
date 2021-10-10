class WantedItemsController < ApplicationController
  
  def new
    @wanted_item = WantedItem.new
  end
  
  def create
    @wanted_item = WantedItem.new(wanted_item_params)
    @wanted_item.user_id = current_user.id
    if @wanted_item.save
      redirect_to wanted_item_path(@wanted_item.id)
    else
      render :new
    end
  end
  
  def show
    @wanted_item = WantedItem.find(params[:id])
  end

  def edit
    if WantedItem.find(params[:id]).present?
      @wanted_item = WantedItem.find(params[:id])
    else
      redirect_to root_path
    end
  end
  
  def update
    @wanted_item = WantedItem.find(params[:id])
    @wanted_item.update(wanted_item_params)
    redirect_to wanted_item_path(@wanted_item.id)
  end
  
  def destroy
    @wanted_item = WantedItem.find(params[:id])
    @wanted_item.destroy
    redirect_to root_path
  end

private

  def wanted_item_params
    params.require(:wanted_item).permit(:title, :explanation, wanted_item_images_images: [])
  end
  
  
end
