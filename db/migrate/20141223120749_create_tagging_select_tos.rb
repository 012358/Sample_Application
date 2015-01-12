class CreateTaggingSelectTos < ActiveRecord::Migration
  def change
    create_table :tagging_select_tos do |t|
      t.string :name

      t.timestamps
    end
  end
end
