class AddColumnToBilling < ActiveRecord::Migration
  def change
    add_column :billings, :completed, :boolean, default: false
  end
end
