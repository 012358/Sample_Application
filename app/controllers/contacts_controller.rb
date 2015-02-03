class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]


  def index
    @contacts = Contact.all
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)

      if @contact.save
        if params[:contact][:photo].blank?
          redirect_to @contact
        else
          render :action => 'crop'
        end
      else
        render :new
      end
  end

  def update
    if @contact.update(contact_params)
      @contact.reprocess_photo
      if params[:contact][:photo].blank?
        redirect_to @contact
      else
        render :action => 'crop'
      end
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def crop

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:name, :photo, :crop_x, :crop_y, :crop_w, :crop_h)
  end
end