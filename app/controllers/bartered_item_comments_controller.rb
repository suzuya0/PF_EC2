class BarteredItemCommentsController < ApplicationController
  
  def create
    bartered_item = BarteredItem.find(params[:bartered_item_id])
    comment = current_user.bartered_item_comments.new(comment_params)
    comment.bartered_item_id = bartered_item.id
    comment.save
    redirect_to bartered_item_path(bartered_item)
  end
  
  def destroy
    BarteredItemComment.find_by(id:params[:id]).destroy
    redirect_to bartered_item_path(params[:bartered_item_id])
  end
  
  private
  
  def comment_params
    params.require(:bartered_item_comment).permit(:comment)
  end
  
end
