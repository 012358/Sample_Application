class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
