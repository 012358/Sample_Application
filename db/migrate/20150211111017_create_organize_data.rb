class CreateOrganizeData < ActiveRecord::Migration
  def change
    create_table :organize_data do |t|
      t.integer :parentId
      t.string :name
      t.string :title


      t.timestamps
    end
  end
end
