class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  def index
    @calendars = Calendar.all.where(user_id: current_user.id) # Return Current User Calendar
    @last_month_calendars = Calendar.range_events
    #Calendar.first.events.reorder('id')
    @calendar_having_gt_10_events = Calendar.joins(:events).group('calendars.id').having('count(events.id) >10')
    # p Calendar.joins("LEFT JOIN events ON calendars.id = events.calendar_id").group('calendars.id').having("count(case when events.start = '#{Date.today}' then events.id else null end) = ?", 0).count
    # p "+++++++++++++++++++++"
    respond_to do |format|
      format.html
      format.json
      format.csv {render text: @calendars.to_csv} #{ send_data @calendars.to_csv }
      format.xls # {render text: @calendars.to_csv((col_sep: "\t"))}
    end
  end

  def show
  end

  def import
    Calendar.import(params[:file])
    redirect_to calendars_path, notice: "Calendar imported."
  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit
  end

  # POST /calendars
  # POST /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to events_url}
        format.json { render :show, status: :created, location: @calendar }
      else
        format.html { render :new }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendars/1
  # PATCH/PUT /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to calendars_path }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render inline: "<%= @calendar.name %><p><%= link_to 'Back', url_for(:back) %></p>" }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.json
  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'Calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params.require(:calendar).permit(:name, :color, :user_id)
    end
end
