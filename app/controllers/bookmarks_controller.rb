class BookmarksController < ApplicationController
  
  def create
    bartered_item = BarteredItem.find(params[:bartered_item_id])
    bookmark = current_user.bookmarks.new(bartered_item_id:bartered_item.id)
    bookmark.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    bartered_item = BarteredItem.find(params[:bartered_item_id])
    bookmark = current_user.bookmarks.find_by(bartered_item_id:bartered_item.id)
    bookmark.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
