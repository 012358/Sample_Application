task :set_title do
  title = ENV['TITLE'] || 'Blog'
  puts "Setting the title: #{title}"
end

# task :set_title1 do
#   title = ENV['TITLE'] || 'Blog'
#   puts "Setting the title: #{title}"
# end


# rake set_title  TITLE='Facebook'
# rake set_title set_title1 TITLE='Facebook'
