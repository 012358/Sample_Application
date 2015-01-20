class BillingsController < ApplicationController

  def index

    @billings = Billing.all.order("id asc").page( params[:page]).per(2)

  end

  def show
    @bill = Billing.find(params[:id])
  end

  def new
    @bill = Billing.new
  end

  def create
    @bill = Billing.new(billing_params)
    @bill.save
    redirect_to billings_path
  end

  def destroy
    @bill = Billing.find(params[:id])
    @bill.destroy
    redirect_to billings_path
  end

  ##################################################
  def switch_task_completed
    @bill = Billing.find(params[:bill])
    p 'saasasasasasasasasasa@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
    p @bill.completed
    @bill.update_attribute(:completed, !@bill.completed)
    render js: "window.location= '#{billings_url}'"
    # end
  end

  private

    def billing_params
      params.require(:billing).permit(:title, :account_number, :completed)
    end

end
