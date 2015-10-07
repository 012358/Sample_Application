if Rails.env == 'development'
  ENV['hyperlinkomatic_server_name'] = 'http://localhost:3009'
else
  ENV['hyperlinkomatic_server_name'] = 'hyperlinkomatic.herokuapp.com'
end