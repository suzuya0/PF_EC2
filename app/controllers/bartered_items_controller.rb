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
    redirect_to barters_path(current_user)
  end
  
  def index
    @bartered_items = BarteredItem.page(params[:page]).where(is_deleted: false).reverse_order
  end
  
  def search
    keywords = params[:keyword].split(/[[:blank:]]+/).select(&:present?)
    @range = params[:range]
    if keywords.present?
      if @range == "全て"
        bartered_items_false = BarteredItem.where(is_deleted: false)
        keywords.inject(bartered_items_false) do |bartered_items,keyword|
          @items = bartered_items.where("title like?", "%#{keyword}%").or(bartered_items.where("explanation like?", "%#{keyword}%"))
        end
        @bartered_items = @items.distinct.page(params[:page]).reverse_order
        @keyword = params[:keyword]
        render "index"
      elsif @range == "募集中"
        bartered_items_false = BarteredItem.where(is_deleted: false).where(barter_status: 0)
        keywords.inject(bartered_items_false) do |bartered_items,keyword|
          @items = bartered_items.where("title like?", "%#{keyword}%").or(bartered_items.where("explanation like?", "%#{keyword}%"))
        end
        @bartered_items = @items.distinct.page(params[:page]).reverse_order
        @keyword = params[:keyword]
        render "index"
      else
        bartered_items_false = BarteredItem.where(is_deleted: false).where(barter_status: 1)
        keywords.inject(bartered_items_false) do |bartered_items,keyword|
          @items = bartered_items.where("title like?", "%#{keyword}%").or(bartered_items.where("explanation like?", "%#{keyword}%"))
        end
        @bartered_items = @items.distinct.page(params[:page]).reverse_order
        @keyword = params[:keyword]
        render "index"
      end
    else
      if @range == "全て"
        @bartered_items = BarteredItem.where(is_deleted: false).page(params[:page]).reverse_order
        render "index"
      elsif @range == "募集中"
        @bartered_items = BarteredItem.where(is_deleted: false).where(barter_status: 0).page(params[:page]).reverse_order
        render "index"
      elsif @range == "取引終了"
        @bartered_items = BarteredItem.where(is_deleted: false).where(barter_status: 1).page(params[:page]).reverse_order
        render "index"
      end
    end
  end
  
private
  def bartered_item_params
    params.require(:bartered_item).permit(:user_id, :title, :explanation, :barter_way, :desired_place, :no1_wanted_item_id, :no2_wanted_item_id, :no3_wanted_item_id, :barter_status, bartered_item_images_images: [])
  end

end
