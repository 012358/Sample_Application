class EnumerationsController < ApplicationController
  before_action :set_enumeration, only: [:show, :edit, :update, :destroy]

  # GET /enumerations
  # GET /enumerations.json
  def index
    @enumerations = Enumeration.all
    EmailType
    PhoneType
  end

  # GET /enumerations/1
  # GET /enumerations/1.json
  def show
  end

  # GET /enumerations/new
  def new
    @enumeration = Enumeration.new(type: params[:type])

  end

  # GET /enumerations/1/edit
  def edit
  end

  # POST /enumerations
  # POST /enumerations.json
  def create
    puts '###########'
    p enumeration_params
    @enumeration = Enumeration.new(enumeration_params)

    respond_to do |format|
      if @enumeration.save
        format.html { redirect_to enumerations_path, notice: 'Enumeration was successfully created.' }
        format.json { render :show, status: :created, location: @enumeration }
      else
        format.html { render :new }
        format.json { render json: @enumeration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enumerations/1
  # PATCH/PUT /enumerations/1.json
  def update
    respond_to do |format|
      if @enumeration.update(enumeration_params)
        format.html { redirect_to enumerations_path, notice: 'Enumeration was successfully updated.' }
        format.json { render :show, status: :ok, location: @enumeration }
      else
        format.html { render :edit }
        format.json { render json: @enumeration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enumerations/1
  # DELETE /enumerations/1.json
  def destroy
    @enumeration.destroy
    respond_to do |format|
      format.html { redirect_to enumerations_url, notice: 'Enumeration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enumeration
      @enumeration = Enumeration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enumeration_params
      params.require(:enumeration).permit(:name, :value, :type)
    end
end
