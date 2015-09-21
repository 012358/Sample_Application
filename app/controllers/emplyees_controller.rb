class EmplyeesController < ApplicationController
  before_action :set_emplyee, only: [:show, :edit, :update, :destroy]

  def index
    @emplyees = Emplyee.all

  end

  def show

  end

  def new
    @emplyee = Emplyee.new

  end

  def edit
  end

  def create
    @emplyee = Emplyee.new(emplyee_params)
    @emplyee.save
    redirect_to emplyees_path
  end

  def update
    @emplyee.update(emplyee_params)
    redirect_to emplyees_path
  end

  def destroy
    @emplyee.destroy
    redirect_to emplyees_path
  end

  private
    def set_emplyee
      @emplyee = Emplyee.find(params[:id])
    end

    def emplyee_params
      params.require(:emplyee).permit(:name, :manager_id)
    end
end
