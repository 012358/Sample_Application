class Form1sController < ApplicationController
  before_action :set_form1, only: [:show, :edit, :update, :destroy]

  def index
    @form1s = Form1.all

  end

  def show

  end

  def new
    @form1 = Form1.new
  end

  def edit
  end

  def create
    @form1 = Form1.new(form1_params)
    @form1.save
    redirect_to parameterize_form_index_path
  end

  def update
    @form1.update(form1_params)
  end

  def destroy
    @form1.destroy
  end

  private
    def set_form1
      @form1 = Form1.find(params[:id])
    end

    def form1_params
      params.require(:form1).permit(:name, :value)
    end
end
