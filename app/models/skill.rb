class Skill < ActiveRecord::Base
  belongs_to :skill_type
  has_and_belongs_to_many :projects
end
