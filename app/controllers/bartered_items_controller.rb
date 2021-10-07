class BarteredItemsController < ApplicationController
  def new
    @bartered_item = BarteredItem.new
  end
  
  def create
    @bartered_item = BarteredItem.new(bartered_item_params)
    if @bartered_item.save!
      redirect_to bartered_item_path(@bartered_item.id)
    else
      render :new
    end
  end
  
  def show
    @bartered_item = BarteredItem.find(params[:id])
  end

  def edit
  end

  def index
  end
  
private
  def bartered_item_params
    params.require(:bartered_item).permit(:user_id, :title, :explanation, :barter_way, :desired_place, :no1_wanted_item_id, :no2_wanted_item_id, :no3_wanted_item_id, bartered_item_images_images: [])
  end

end
