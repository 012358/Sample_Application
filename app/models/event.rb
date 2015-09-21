class Event < ActiveRecord::Base
  belongs_to :calendar, inverse_of: :events

end
