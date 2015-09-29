class Importcsv
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  def perform(row)
      calendar = Calendar.new
      calendar.attributes = row
      calendar.save
  end
end