class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def welcome
    @chatrooms = Chatroom.includes(:messages)
                         .references(:messages)
                         .all
  end
end
