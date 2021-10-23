class BarteredItemCommentsController < ApplicationController
  
  def create
    @bartered_item = BarteredItem.find(params[:bartered_item_id])
    @bartered_item_comment = current_user.bartered_item_comments.new(comment_params)
    @bartered_item_comment.bartered_item_id = @bartered_item.id
    @bartered_item_comment.save
  end
  
  def destroy
    @bartered_item = BarteredItem.find(params[:bartered_item_id])
    comment = @bartered_item.bartered_item_comments.find(params[:id])
    comment.destroy
  end
  
  private
  
  def comment_params
    params.require(:bartered_item_comment).permit(:comment)
  end
  
end
