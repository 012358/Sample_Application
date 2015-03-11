class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = [] #= Event.all
    user_calendars = Calendar.all.where(user_id: current_user.id)
    user_calendars.each do |calendar|
       @events+=(calendar.events)
    end
    respond_to do |format|
      format.html
      format.json
    end

    if current_user.calendars.empty?
      Calendar.create(name: "Sajjad Murtaza Calendar #{current_user.email}", color: '#E29792', user_id: current_user.id)
      Event.create(calendar_id: Calendar.find_by(name: "Sajjad Murtaza Calendar #{current_user.email}").id, title: "This is a (#{current_user.email}) Event.", description: 'You can Add multiple events against Single Calendar', start: Time.now, end: Time.now+123456)
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_url}
        format.json { render :show, status: :created, location: events_url }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update

      @event.update(event_params)
      redirect_to events_url

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start, :end, :calendar_id)
    end
end
