class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    if logged_in?
      @event = Event.new
    else
      redirect_to login_path
    end
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user.email
    if @event.save
      flash[:success] = "Event successfully created!"
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    flash[:success] = "Event successfully updated!"
    redirect_to event_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "Event successfully deleted!"
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date)
  end

end
