class AddTitleToUsers < ActiveRecord::Migration
  def change
    add_column :billings, :title, :string
  end
end
