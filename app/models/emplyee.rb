class Emplyee < ActiveRecord::Base
  has_many :employees, foreign_key: 'manager_id', class_name: 'Emplyee'
  belongs_to :manager, foreign_key: 'manager_id', class_name: 'Emplyee'
end
