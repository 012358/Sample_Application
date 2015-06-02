class AddColumnInCalendar < ActiveRecord::Migration
  def change
    add_column :calendars, :other_details, :text
  end
end
