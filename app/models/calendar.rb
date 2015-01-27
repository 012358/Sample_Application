class Calendar < ActiveRecord::Base
  has_many :events
  def as_json(options= {})
    {id: self.id, text: self.name}
  end
end
