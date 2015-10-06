class Skill < ActiveRecord::Base
  belongs_to :skill_type
  has_and_belongs_to_many :projects, :join_table => 'projects_skills'

  def as_json(options = {})
    { id: id, text: name }
  end

end
