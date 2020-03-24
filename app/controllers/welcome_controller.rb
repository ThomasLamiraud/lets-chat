class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def welcome
    @chatrooms = Chatroom.all
  end
end
