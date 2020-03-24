class ChatroomsController < ApplicationController

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      respond_to do |format|
        format.html { redirect_to chatroom_path(@chatroom.slug) }
      end
    else
      respond_to do |format|
        flash.now[:notice] = {error: ["a chatroom with this topic already exists"]}
        format.html { redirect_to new_chatroom_path }
      end
    end
  end

  def update
    chatroom = Chatroom.find_by(slug: params[:slug])
    chatroom.update(chatroom_params)
    redirect_to chatroom
  end

  def show
    @chatroom = Chatroom.find_by(slug: params[:slug])
    @message = Message.new
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:topic, :slug)
  end
end
