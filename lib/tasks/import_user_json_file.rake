namespace :demo do
  require 'json'
  require 'csv'
  desc 'Import User From json File ...'

  task import_user: :environment do
    if ENV['USER_FILE'].nil? and ENV['USER_FILE_CSV'].nil?
      p 'Please specify the file path e.g. rake demo:import_user USER-FILE=/home/sajjad/Desktop/users.json ... '
    else
      if ENV['USER_FILE_CSV'].present?
        csv_file = File.read(ENV['USER_FILE_CSV'])
        csv = CSV.parse(csv_file, headers: true)

        # p '!!!!!!!!!!'
        # p csv['color']
        # p csv['name'].to_csv
        # p '!!!!!!!!!!'

        # x=csv.find {|row| row['id']}
        # p x['color']

        csv.each do |data|
          p '!!!!!!!!!!'
          p data['color']
          p data['name']
          p '!!!!!!!!!!'
        end

      elsif ENV['USER_FILE'].present?

        json_file = File.read(ENV['USER_FILE'])
        json_data = JSON.parse(json_file)
        json_data.each do |record|
          p '+++++++++++++++'
          p record['id']
          p record['password']
          p record['password_confirmation']
          p '+++++++++++++++'
          # User.create(email: record['mu_email'], password: record['password'], password_confirmation: record['password_confirmation'])
        end
      end

    end
  end
end

# e.g(on Desktop) 1.json
# [{"id":58,"mu_email":"sa@yahoo.com21","password":"1234567890","password_confirmation":"1234567890","url":"http://localhost:3009/users/58.json"},
# {"id":59,"mu_email":"sa@yahoo.com33","password":"1234567890","password_confirmation":"1234567890","url":"http://localhost:3009/users/59.json"}]

#  rake demo:import_user USER_FILE=/home/sajjad/Desktop/1.json






# +++++++++++++++++++++++++++++++++++++++++++++++++++++++

# id	name	                  color	  created_at	            updated_at
# 12	Sajjad Murtaza Calendar	#E29792	2015-02-03 11:30:29 UTC	2015-02-03 11:30:29 UTC

# rake demo:import_user USER_FILE_CSV=/home/sajjad/Desktop/calendars.csv


