class CreateBookMarks < ActiveRecord::Migration
  def change
    create_table :book_marks do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
