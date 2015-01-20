class Form2sController < ApplicationController
  before_action :set_form2, only: [:show, :edit, :update, :destroy]

  def index
    @form2s = Form2.all
    p attribute
  end

  def show

  end

  def new
    @form2 = Form2.new
  end

  def edit
  end

  def create
    @form2 = Form2.new(form2_params)
    @form2.save
    redirect_to parameterize_form_index_path
  end

  def update
    @form2.update(form2_params)
  end

  def destroy
    @form2.destroy
  end

  private
    def set_form2
      @form2 = Form2.find(params[:id])
    end

    def form2_params
      params.require(:form2).permit(:name, :amount)
    end
end
