class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  def index
    @calendars = current_user.calendars#.where(user_id: current_user.id) # Return Current User Calendar
    @last_month_calendars = current_user.calendars.range_events
    @calendar_having_gt_10_events = current_user.calendars.joins(:events).group('calendars.id').having('count(events.id) >10')
    # Calendar.joins(:events).group('calendars.id').having('count(events.id) >10')
    # Calendar.joins("LEFT JOIN events ON calendars.id = events.calendar_id").group('calendars.id').having("count(case when events.start = '#{Date.today}' then events.id else null end) = ?", 0).count

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
    CSV.foreach(params[:file].path, headers: true) do |row|
      attrs ={name: row[0]} #
      Importcsv.perform_async(attrs)
    end
    redirect_to calendars_path, notice: 'Calendar imported.'
  end

  def new
    @calendar = Calendar.new
  end

  def edit
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.inspect
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

  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'Calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    def calendar_params
      params.require(:calendar).permit(:name, :color, :user_id)
    end
end
