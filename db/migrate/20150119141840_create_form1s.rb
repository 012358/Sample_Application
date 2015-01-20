class CreateForm1s < ActiveRecord::Migration
  def change
    create_table :form1s do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
