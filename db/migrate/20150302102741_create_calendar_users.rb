class CreateCalendarUsers < ActiveRecord::Migration
  def change
    create_table :calendar_users do |t|
      t.references :user, index: true
      t.references :calendar, index: true

      t.timestamps
    end
  end
end
