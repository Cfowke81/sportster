class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @event = @user.events
  end

end
