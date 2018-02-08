class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      log_in @event
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
    params.require(:event).permit(:location, :date)
  end

end
