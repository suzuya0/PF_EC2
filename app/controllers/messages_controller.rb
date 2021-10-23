class MessagesController < ApplicationController
  
  def create
    room = Room.find(params[:message][:room_id])
    @messages = room.messages
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました"
    end
  end
  
  def destroy
    message = Message.find(params[:id])
    room = message.room
    @messages = room.messages
    message.destroy
  end
  
end
