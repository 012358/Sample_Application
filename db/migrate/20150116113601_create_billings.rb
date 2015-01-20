class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|

      t.timestamps
    end
  end
end
