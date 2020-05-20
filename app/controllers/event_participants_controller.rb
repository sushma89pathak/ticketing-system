class EventParticipantsController < ApplicationController
  before_action :set_event
  before_action :event_participants

  def create
    event_participants.create(user: current_user, ticket_id: params[:ticket_id])
    respond_to do |format|
      format.js {
        render :template => "events/show.js.erb",
               :layout => false
      }
    end
  end

  def delete
    event_participants.where(user: current_user)[0].destroy
    respond_to do |format|
      format.js {
        render :template => "events/show.js.erb",
               :layout => false
      }
    end
  end

  private

  def sign_up_params
    params.require(:event_participant).permit(:event_id, :user_id)
  end

  def set_event
    @event = Event.find params[:id]
  end

  def event_participants
    @event.event_participants
  end
end
