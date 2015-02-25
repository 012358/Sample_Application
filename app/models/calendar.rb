class Calendar < ActiveRecord::Base
  has_many :events, dependent: :destroy


  def as_json(options= {})
    {id: self.id, text: self.name}
  end

  def self.import(file)
    # CSV.foreach(file.path, headers: true) do |row|
    #   Calendar.create! row.to_hash
    # end

    CSV.foreach(file.path, headers: true) do |row|
      calendar = find_by_id(row['id']) || new
      calendar.attributes = row.to_hash
      calendar.save!
    end
  end

  def self.to_csv(option = {})
    CSV.generate(option) do |csv|
      csv << column_names
      all.each do |calendar|
        csv << calendar.attributes.values_at(*column_names)
      end
    end
  end
end




# http://railscasts.com/episodes/362-exporting-csv-and-excel

# http://railscasts.com/episodes/396-importing-csv-and-excel
# https://github.com/roo-rb/roo