class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @bartered_items = BarteredItem.where(is_deleted: false).where(user_id: @user.id).last(4).reverse
    @wanted_items = WantedItem.where(user_id: @user.id).last(4).reverse
    @bookmarks = Bookmark.where(user_id: @user.id).last(4).reverse
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

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to user_path(@user)
    end
  end
  
  def update
    @user =User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def delete
    @user = current_user
    @user.update(is_deleted: true) #is_deletedをfalseからtrueへ変更し、論理削除
    reset_session #セッション情報のリセットする
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
  def confirm
  end

  def barter
    @bartered_items = BarteredItem.where(is_deleted: false).where(user_id: params[:id])
  end

  def want
    @wanted_items = WantedItem.where(user_id: params[:id])
  end

  def bookmark
    @bookmarks =Bookmark.where(user_id: current_user.id).reverse
  end
  
  def room
    @entries = Entry.where(user_id: current_user.id)
    @entries2 = Entry.none
    @entries.each do |entry|
      @entries2 += Entry.where(room_id: entry.room_id).where.not(user_id: current_user.id)#####where.notで指定以外を取得(参考https://www.sejuku.net/blog/13363）#####
    end
  end
  
  def user_params
    params.require(:user).permit(:email, :nick_name, :introduction, :barter_way, :desired_place, :image)
  end
  
end
