class AddNamePhoneAddressCountryJobTitle < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :job_title, :string
    add_column :users, :address, :text
    add_column :users, :country, :string
  end
end
