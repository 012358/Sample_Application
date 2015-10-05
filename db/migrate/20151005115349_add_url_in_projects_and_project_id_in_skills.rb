class AddUrlInProjectsAndProjectIdInSkills < ActiveRecord::Migration
  def change
    add_column :projects, :url, :string

    create_table :projects_skills, id: false do |t|
      t.integer :project_id
      t.integer :skill_id
    end
  end
end
