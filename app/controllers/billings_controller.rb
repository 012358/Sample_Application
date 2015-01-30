class BillingsController < ApplicationController

  def index

    @billings = Billing.all.order("id asc").page( params[:page]).per(2)

  end

  def show
    @bill = Billing.find(params[:id])

    respond_to  do |format|
      format.html
      format.pdf do
      pdf = render_to_string :pdf => 'sajjad-murtaza',
                             layout: 'pdf.html.erb',
                             template: 'billings/show.pdf.slim',
                             header: { :right => '[page] of [topage]'},
                             margin: {top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0},
                             outline: {outline: true,
                                       outline_depth: 2},
                             :encoding => 'UTF-8'
      send_data(pdf, :filename => @bill.title,  :type=>'application/pdf')
      # def application_review_pdf
      #   @applicants = @job.applicants
      #   paths_array = []
      #   html = render_to_string('employers/jobs/pdf/application_review_pdf.pdf.erb')
      #   pdf = WickedPdf.new.pdf_from_string(html,
      #                                       toc: {
      #                                           disable_dotted_lines: true,
      #                                           disable_toc_links: true,
      #                                           level_indentation: 3,
      #                                           text_size_shrink: 0.5,
      #                                           depth: 2
      #                                       },
      #                                       header: {:html => {:template => 'employers/jobs/pdf/header.pdf.erb'}})
      #
      #   save_path = Rails.root.join('public', 'application.pdf')
      #   File.open(save_path, 'wb') do |file|
      #     file << pdf
      #   end
      #   paths_array << save_path
      #   @applicants.each do |app|
      #     paths_array << app.resume.path unless app.resume.blank?
      #     paths_array << app.cover_letter.path unless app.cover_letter.blank?
      #   end
      #   begin
      #     Pdftk.new.merge(paths_array, "#{Rails.root}/public/application_review.pdf")
      #     send_file(
      #         "#{Rails.root}/public/application_review.pdf",
      #         filename: "application_review_#{@job.title}.pdf",
      #         type: 'application/pdf'
      #     )
      #   rescue
      #     send_file(
      #         "#{Rails.root}/public/application_review.pdf",
      #         filename: "application_review_#{@job.title}.pdf",
      #         type: 'application/pdf'
      #     )
      #   end
      # end
      #
      # https://github.com/webkrak/pdftk

      end
    end
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
