class CreateEnumerations < ActiveRecord::Migration
  def change
    create_table :enumerations do |t|
      t.string :name
      t.integer :value
      t.string :type

      t.timestamps
    end
  end
end
