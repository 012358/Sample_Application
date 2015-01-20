class AddAccountNumberToBilling < ActiveRecord::Migration
  def change
    add_column :billings, :account_title, :string
  end
end
