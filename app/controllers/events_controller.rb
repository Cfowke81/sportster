class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
    @state_collection = Event::STATES
    @loc_collection = Event::LOC
    @sport_collection = Event::SPORTS
  end

  def create
    @event = Event.new(item_params)
    @event.user_id = current_user.id
    if @event.save
      flash[:notice] = 'Item was successfully added'
      redirect_to user_path(current_user)
    else
      @users = User.all
      flash[:alert] = @event.errors.full_messages.join('. ')
      render :new
    end
  end

  private

  def item_params
    params.require(:event).permit(:name, :description, :address, :city, :state, :zip, :loc, :sport, :user_id)
  end
end
