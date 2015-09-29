class Calendar < ActiveRecord::Base
  include MultiInheri1
  include MultiInheri2
  has_many :events, -> { order('created_at DESC') }, dependent: :destroy
  has_many :calendar_users
  belongs_to :user

  serialize :other_details, Array
  before_save :serialize_other_details

  # validates_format_of :name, :with => /\A[a-z A-Z]+\z/,  :message => "Please use only regular letters as name"


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
      calendar.save
    end
  end


  def self.to_csv(option = {})
    CSV.generate(option) do |csv|
      csv << ['user_id', 'created_at']
      [[111,"Tue, 30 Jun 2015 23:50:55 KST +09:00"],[123,"Tue, 30 Jun 2015 23:50:55 KST +09:00"]].each do |array|
        csv << array
      end
    end
  end

  def self.range_events
    where(created_at: (Time.now - 30.day)..Time.now)
  end

  def serialize_other_details
    p "^^^^^^^^^^^^^^^^^^"
    p self.other_details = [name: 'Sajjad', education: 'Bs Computer Science']
  end


end




# http://railscasts.com/episodes/362-exporting-csv-and-excel

# http://railscasts.com/episodes/396-importing-csv-and-excel
# https://github.com/roo-rb/roo