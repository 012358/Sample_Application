class CreateBookMarks < ActiveRecord::Migration
  def change
    create_table :book_marks do |t|
      t.string :title
      t.string :url
      t.string :description
      t.integer :api_id

      t.timestamps
    end
  end
end
