class CreateForm2s < ActiveRecord::Migration
  def change
    create_table :form2s do |t|
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
