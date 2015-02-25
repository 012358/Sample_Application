namespace :sample do
  task :say_hello_task do
    desc '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
    puts '####################'
    puts 'Hello My First Rake Task ... '
    puts '####################'
  end
end

# rake sample:say_hello_task