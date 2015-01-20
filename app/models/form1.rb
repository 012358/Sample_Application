class Form1 < ActiveRecord::Base

  def self.form1_attribute
    Form1.column_names
  end

end
