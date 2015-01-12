class CreateCocoonExamples < ActiveRecord::Migration
  def change
    create_table :cocoon_examples do |t|
      t.string :name

      t.timestamps
    end
  end
end
