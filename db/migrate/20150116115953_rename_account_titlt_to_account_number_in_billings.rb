class RenameAccountTitltToAccountNumberInBillings < ActiveRecord::Migration
  def change
    rename_column :billings, :account_title, :account_number
  end
end
