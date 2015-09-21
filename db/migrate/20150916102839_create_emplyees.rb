class CreateEmplyees < ActiveRecord::Migration
  def change
    create_table :emplyees do |t|
      t.string :name
      t.integer :manager_id

      t.timestamps
    end
  end
end
