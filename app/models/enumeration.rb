class Enumeration < ActiveRecord::Base

  def test
    puts 'Hello this is test in parent'
  end

  def to_param
    "#{id} #{name}".parameterize
  end

end
