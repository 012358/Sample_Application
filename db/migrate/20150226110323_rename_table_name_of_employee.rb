class RenameTableNameOfEmployee < ActiveRecord::Migration
  def change
    rename_table :employees, :staffs
  end
end
