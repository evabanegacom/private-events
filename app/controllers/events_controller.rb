class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  # before_action :require_invite_date, except: %i[index new edit destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @upcoming_events = Event.future_events(Time.now).sort_by(&:event_date)
    @previous_events = Event.past_events(Time.now).sort_by(&:event_date)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @users = User.all
    @registered_attendees = @event.attendees
  end

  # GET /events/new
  def new
    @event = User.find(session[:user_id]).events.build
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  def create
    @event = User.find(session[:user_id]).events.build(event_params)
    if @event.event_date < Time.now
      flash.notice = 'cant create a past date event'
      render :new
      return
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:event, :description, :event_date)
  end

  def require_login
    # session[:user_id] = nil
    if session[:user_id]
      true
    else
      redirect_to new_session_path
      false
    end
  end

  # def invite_date
  #   return 'cant create a past event' if Time.now > @event.event_date
  # end
end
