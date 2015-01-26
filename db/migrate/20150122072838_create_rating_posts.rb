class CreateRatingPosts < ActiveRecord::Migration
  def change
    create_table :rating_posts do |t|
      t.string :title

      t.timestamps
    end
  end
end
