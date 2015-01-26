class CreateRatingUsers < ActiveRecord::Migration
  def change
    create_table :rating_users do |t|
      t.string :name

      t.timestamps
    end
  end
end
