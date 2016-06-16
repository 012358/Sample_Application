class DefaultController < ApplicationController
  skip_load_and_authorize_resource
  def index
    @calendars = Calendar.includes(:events).all
  end

  def book_marks_list
    if current_user.email[0..5]=='sajjad'

      require 'net/http'
      require 'net/https'
      url = ENV['hyperlinkomatic_server_name']
      uri = URI("#{url}/api/v1/book_marks")
      # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      #  response = Net::HTTP.get(uri)                                       Simple

      # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      Net::HTTP.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Get.new uri
        request['key'] = 'https://github.com/sajjadmurtaza49-jhdjkf874324b3248b4sdf'
        response = http.request request # Net::HTTPResponse object
        @hyperlinkomatic_book_marks =  JSON.parse(response.body)
      end
      @hyperlinkomatic_book_marks.each do |bm|
        @bk = BookMark.find_or_create_by(api_id: bm['id'])
        @bk.title = bm['title']
        @bk.url = bm['link_path']
        @bk.description = bm['description']
        @bk.save
      end

      # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      # uri = URI('http://localhost:3000/api/v1/users')
      # http = Net::HTTP.new(uri.host, uri.port)

      # # if same params on both side
      # # app-1=>user ->  params.require(:user).permit(:mu_email, :password, :password_confirmation)
      # # app-2=>user ->  params.require(:user).permit(:mu_email, :password, :password_confirmation)
      # response = http.post(uri.path, params.to_query)

      # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      # uri = URI('http://localhost:3000/api/v1/users')
      # Net::HTTP.post_form(uri, {"user[email]" => user_params[:mu_email], "user[password]" => "whatever", "user[password_confirmation]" => "whatever"})

      # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ For Create
      # uri = URI.parse('http://localhost:3000/api/v1/users')
      # http = Net::HTTP.new(uri.host,uri.port)
      # req = Net::HTTP::Post.new(uri.path)
      # req['key'] = '0092-7852184MGhhxLKz69kqmi96YGr25nitvZ-sajjad-murtaza'
      # req.set_form_data({"user[email]" => user_params[:mu_email], "user[password]" => "whatever", "user[password_confirmation]" => "whatever"})
      # res = http.request(req)
      # puts res.body

      # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      # uri = URI('http://localhost:3000/api/v1/users')
      # #https = Net::HTTP.new(uri.host, uri.port)
      # request = Net::HTTP::Post.new(uri.path)
      # request["key"] = '0092-7852184MGhhxLKz69kqmi96YGr25nitvZ-sajjad-murtaza'
      # # response = https.request(request)
      # puts response

      # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      # if request.headers['key'] == '0092-7852184MGhhxLKz69kqmi96YGr25nitvZ-sajjad-murtaza'
      #   return true
      # else
      #   render json: "Authentication failed"
      # end

    else
      redirect_to default_index_path
    end
  end
end
