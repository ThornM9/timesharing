class EventsController < ApplicationController
  before_action :require_user
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:destroy]
  
  def show
  end
  
  def showschedule
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
      if @event.save
        flash[:success] = "Event was successfully saved"
      else
        flash.now[:danger] = "Event wasn't saved. This is either because you currently aren't signed in, or the event wasn't given a name"
        render 'new'
      end
  end
  
  def destroy
    @event.destroy
    redirect_to schedule_path
    flash[:danger] = "Event was successfully destroyed"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_name, :event_day, :start_index, :end_index, :event_color)
    end
  
    def require_same_user
      if current_user != @event.user
        flash[:danger] = "You can only edit or delete your own events"
        redirect_to root_path
      end
    end
end