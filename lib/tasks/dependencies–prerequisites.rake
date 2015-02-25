namespace :db do
  task :clean do
    puts 'Its clean ..'
  end
end

task :seed => 'db:clean' do
  puts 'its seed'
end


#  rake seed
#  rake db:clean