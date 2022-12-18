class Public::UserRoomsController < ApplicationController
  def show
      @chat = Chat.new
      room = Room.find(params[:id])
      @chats = Chat.where(room: room)
  end
end
