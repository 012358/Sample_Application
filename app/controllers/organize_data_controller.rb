class OrganizeDataController < ApplicationController
  before_action :set_organize_datum, only: [:show, :edit, :update, :destroy]

  def index
    @organize_data = OrganizeDatum.all
  end

  def show

  end

  def new
    @organize_datum = OrganizeDatum.new

  end

  def edit
  end

  def create
    @organize_datum = OrganizeDatum.new(organize_datum_params)
    @organize_datum.save
    redirect_to organize_data_path
  end

  def update
    @organize_datum.update(organize_datum_params)

  end

  def destroy
    @organize_datum.destroy

  end

  private
    def set_organize_datum
      @organize_datum = OrganizeDatum.find(params[:id])
    end

    def organize_datum_params
      params.require(:organize_datum).permit(:parentId, :name, :title)
    end
end
