class EventsController < ApplicationController
  include EventsHelper

  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.user = User.find(1)

    if @event.save
      flash[:success] = "Your EVENT was CREATED successfully!"
      redirect_to @event
    else
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:success] = "Your EVENT was UPDATED successfully!"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def show
    @event = Event.find(params[:id])
    @status = event_status_translator(@event.status)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

private
  def event_params
    params.require(:event).permit(:title, :notes, :status)
  end
end
