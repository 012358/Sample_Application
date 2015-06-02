module MultiInheri1
  def sayhello1
    puts "This is 1"
  end

  def self.hello
    puts "Its is self ........"
  end

  module ClassMethods
    def total_word_count
      puts "Total = "
    end
  end

  def self.included(including_class)
    including_class.extend ClassMethods
  end
end