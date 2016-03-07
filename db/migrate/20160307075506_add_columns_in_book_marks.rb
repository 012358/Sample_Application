class AddColumnsInBookMarks < ActiveRecord::Migration
  def change
    add_column :book_marks, :description, :text
    add_column :book_marks, :api_id, :integer
  end
end
