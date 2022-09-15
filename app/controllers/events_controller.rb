class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :event_date, :creator_id)
  end
end
