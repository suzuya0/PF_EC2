class BarteredItemsController < ApplicationController
  
  def new
    @bartered_item = BarteredItem.new
  end
  
  def create
    @bartered_item = BarteredItem.new(bartered_item_params)
    @bartered_item.no1_wanted_item_id 
    if @bartered_item.save
      redirect_to bartered_item_path(@bartered_item.id)
    else
      render :new
    end
  end
  
  def show
    @bartered_item = BarteredItem.find(params[:id])
    
    if @bartered_item.is_deleted == true
      redirect_to root_path
    end
    
    @bartered_item_comment = BarteredItemComment.new
    no1_wanted_item = WantedItem.where(id: @bartered_item.no1_wanted_item_id)
    no2_wanted_item = WantedItem.where(id: @bartered_item.no2_wanted_item_id)
    no3_wanted_item = WantedItem.where(id: @bartered_item.no3_wanted_item_id)
    @wanted_items = no1_wanted_item + no2_wanted_item + no3_wanted_item
  
    @user = @bartered_item.user
    if user_signed_in?
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      unless @user == current_user
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id
              @isRoom = true
              @roomID = cu.room_id
            end
          end
        end
        unless @isRoom
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end

  def edit
    @bartered_item = BarteredItem.find(params[:id])
    if @bartered_item.is_deleted == true
      redirect_to root_path
    end
  end
  
  def update
    @bartered_item = BarteredItem.find(params[:id])
    @bartered_item.update(bartered_item_params)
    redirect_to bartered_item_path(@bartered_item.id)
  end
  
  def delete
    @bartered_item = BarteredItem.find(params[:id])
    @bartered_item.update(is_deleted: true)
    redirect_to root_path
  end
  
  def index
    @bartered_items = BarteredItem.where(is_deleted: false)
  end
  
  def search
    keywords = params[:keyword].split(/[[:blank:]]+/).select(&:present?)
    if keywords.present?
      bartered_items_false = BarteredItem.where(is_deleted: false)
      keywords.inject(bartered_items_false) do |bartered_items,keyword|
        @items = bartered_items.where("title like?", "%#{keyword}%").or(bartered_items.where("explanation like?", "%#{keyword}%"))
      end
      @bartered_items = @items.distinct
      @keyword = params[:keyword]
      render "index"
    else
      flash[:notice] = '検索欄が未入力です。検索する際は、文字を入力して下さい。'
      @bartered_items = BarteredItem.all
      redirect_to bartered_items_path
    end
  end
  
private
  def bartered_item_params
    params.require(:bartered_item).permit(:user_id, :title, :explanation, :barter_way, :desired_place, :no1_wanted_item_id, :no2_wanted_item_id, :no3_wanted_item_id, :barter_status, bartered_item_images_images: [])
  end

end
