class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|
      t.integer :skill_id
      t.integer :user_id
      t.string :rating
      t.string :experience

      t.timestamps
    end
  end
end
