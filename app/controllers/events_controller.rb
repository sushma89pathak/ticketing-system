class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.includes(:users, :tickets).find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

end
