class TaggingSelectTosController < ApplicationController
  before_action :set_tagging_select_to, only: [:show, :edit, :update, :destroy]

  # GET /tagging_select_tos
  # GET /tagging_select_tos.json
  def index
    @tagging_select_tos = TaggingSelectTo.all
    if @tagging_select_tos.empty?
      TaggingSelectTo.create(name: 'Sajjad-Murtaza-Testing-Taggable')
    end
  end

  # GET /tagging_select_tos/1
  # GET /tagging_select_tos/1.json
  def show
  end

  # GET /tagging_select_tos/new
  def new
    @tagging_select_to = TaggingSelectTo.new
  end

  # GET /tagging_select_tos/1/edit
  def edit
  end

  # POST /tagging_select_tos
  # POST /tagging_select_tos.json
  def create
    @tagging_select_to = TaggingSelectTo.new(tagging_select_to_params)

    respond_to do |format|
      if @tagging_select_to.save
        format.html {    redirect_to tagging_select_tos_path }
        format.json { render :show, status: :created, location: @tagging_select_to }
      else
        format.html { render :new }
        format.json { render json: @tagging_select_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tagging_select_tos/1
  # PATCH/PUT /tagging_select_tos/1.json
  def update
    respond_to do |format|
      if @tagging_select_to.update(tagging_select_to_params)
        format.html { redirect_to @tagging_select_to, notice: 'Tagging select to was successfully updated.' }
        format.json { render :show, status: :ok, location: @tagging_select_to }
      else
        format.html { render :edit }
        format.json { render json: @tagging_select_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tagging_select_tos/1
  # DELETE /tagging_select_tos/1.json
  def destroy
    @tagging_select_to.destroy
    respond_to do |format|
      format.html { redirect_to tagging_select_tos_url, notice: 'Tagging select to was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tagging_select_to
      @tagging_select_to = TaggingSelectTo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tagging_select_to_params
      params.require(:tagging_select_to).permit(:name)
    end
end
