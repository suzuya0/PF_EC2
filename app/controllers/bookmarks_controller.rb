class BookmarksController < ApplicationController
  
  def create
    @bartered_item = BarteredItem.find(params[:bartered_item_id])
    bookmark = current_user.bookmarks.new(bartered_item_id: @bartered_item.id)
    bookmark.save
  end
  
  
  def destroy
    @bartered_item = BarteredItem.find(params[:bartered_item_id])
    bookmark = current_user.bookmarks.find_by(bartered_item_id: @bartered_item.id)
    bookmark.destroy
  end
  
end
