class CreateImportantPoints < ActiveRecord::Migration
  def change
    create_table :important_points do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
