class CocoonExamplesController < ApplicationController
  before_action :set_cocoon_example, only: [:show, :edit, :update, :destroy]

  # GET /cocoon_examples
  # GET /cocoon_examples.json
  def index
    @cocoon_examples = CocoonExample.all
  end

  # GET /cocoon_examples/1
  # GET /cocoon_examples/1.json
  def show
  end

  # GET /cocoon_examples/new
  def new
    @cocoon_example = CocoonExample.new
  end

  # GET /cocoon_examples/1/edit
  def edit
  end

  # POST /cocoon_examples
  # POST /cocoon_examples.json
  def create
    @cocoon_example = CocoonExample.new(cocoon_example_params)

    respond_to do |format|
      if @cocoon_example.save
        format.html { redirect_to @cocoon_example, notice: 'Cocoon example was successfully created.' }
        format.json { render :show, status: :created, location: @cocoon_example }
      else
        format.html { render :new }
        format.json { render json: @cocoon_example.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cocoon_examples/1
  # PATCH/PUT /cocoon_examples/1.json
  def update
    respond_to do |format|
      if @cocoon_example.update(cocoon_example_params)
        format.html { redirect_to @cocoon_example, notice: 'Cocoon example was successfully updated.' }
        format.json { render :show, status: :ok, location: @cocoon_example }
      else
        format.html { render :edit }
        format.json { render json: @cocoon_example.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cocoon_examples/1
  # DELETE /cocoon_examples/1.json
  def destroy
    @cocoon_example.destroy
    respond_to do |format|
      format.html { redirect_to cocoon_examples_url, notice: 'Cocoon example was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocoon_example
      @cocoon_example = CocoonExample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cocoon_example_params
      params.require(:cocoon_example).permit(:name)
    end
end
