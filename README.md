## SM-Sample_Application
This Sample_Application covered all basic concepts. [Click for Live Demo](https://sm-sample-application.herokuapp.com/)
#### Calendar(Full Calendar Plugin)  
[Calendar view like Full Calendar](http://fullcalendar.io)  
(FullCalendar is for displaying events, and it is a solution for event content-management. Beyond dragging an event to a different time/day, you can change an event's name, etc. )  
+ You can add Calendar(e.g Test-Calendar 1), Every calendar has color
+ Add Events for particular Calendar, Events have different color.

#### Taggable(Select2)
[Taggable View Like Demo Select2](https://select2.github.io/examples.html)  
(Select2 add a form field which can auto fill text & can take multiple tabs(similar to fb) and gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options.). Here in our application  
+ Multiple attribute show in select2 field
+ You can choise and search from dropdown and also add new which is not predefined in select2 dropdown.   

###### How To Implement  
 
```javascript
gem "select2-rails"  
'In app/assets/javascripts/application.js': 
				//= require select2

'In app/assets/stylesheets/application.css':
				*= require select2

<%= f.text_field :name, class: "single-taggable-field",data: {options: Enumeration.pluck(:name)}, placeholder: 'Enter Name' %>  
$(".single-taggable-field").select2(  
    tags: $('.single-taggable-field').data('options')  
    width: "252px"  
  );  

<%= f.text_field :calendar_id, class: "single-field",data: {options: Calendar.all} %>  
$('.single-field').each ->  
    $(this).select2  
      data: $(this).data('options')  
      width: "252px"  
      multiple: false  

'In MODEL': 		def as_json(options= {})  
    				{id: self.id, text: self.name}  
  			end  
```
#### Nested forms(cocoon)
[Cocoon Documentation](https://github.com/nathanvda/cocoon)  
(Make dynamic nested forms). In Our application
+ Add multiple task(form) against project.  

#### PDF(Wicked PDF)
[Wicked PDF](https://github.com/mileszs/wicked_pdf)  
(PDF generator (from HTML) plugin for Ruby on Rails)  
+ .............wicked_pdf is a wrapper for wkhtmltopdf, you'll need to install that, too.............  
```javascript
gem 'wicked_pdf'  
gem 'wkhtmltopdf-binary'  

'In CONTROLEER':		respond_to do |format|
				      format.html
				      format.pdf do
					render :pdf => "file_name"
					#render pdf:
						#templete: 'controller_name/file_name.pdf.slim'
				      end
				    end
				  end

```

#### STI-Single Table Inheritance(Enumeration)
[STI lets you save different models inheriting from the same model inside a single table.](http://samurails.com/tutorial/single-table-inheritance-with-rails-4-part-1/)  
For example  
+  You have an employee model.
+ The employees can be of two types : manager or developer(They pretty much share the same attributes and columns.Creating two tables having the exact same fields would be bad.)
+ With STI, you can just keep your employee model and simply subclass it with your two types of employee.  

###### How To Implement

```javascript
'In MODEL'      :

			class Enumeration < ActiveRecord::Base
				    
			end

			class Child < Parend

			end

'In CONTROLLER' :

			def new
		    	   @enumeration = Enumeration.new(type: params[:type])
		        end

'In Views'      :

		    Where Linke
				<% @enumerations.subclasses.each do |subclass| %>
					  <%= link_to subclass, new_enumeration_path(type: subclass) %>
				<% end %>

		    Where Form
				<%= form_for @enumeration.becomes(Enumeration) do |f| %>  

become use for
              Change from a superclass to a subclass without accessing the “type” attribute directly.Returns an instance of the specified klass with the attributes of the current record.
```
#### Pagination(Kaminari)
[Flexible solution for pagination](https://github.com/amatsuda/kaminari)
###### How To Implement  
 
```javascript
gem 'kaminari'
bundle install
In CONTROLLER :  @instance_variable = Model.all.order("id asc").page( params[:page]).per(2)
In VIEW       :  <%= paginate @instance_variable %>
```


#### Authentication(Devise)
[Flexible authentication solution for Rails](https://github.com/plataformatec/devise)  
(Allows you to have multiple models signed in at the same time.). In our application  
+ Also Login from Google [Here Documentation](https://github.com/zquestz/omniauth-google-oauth2)  

###### How To Implement

```javascript
gem 'devise'  
bundle install  
rails generate devise:install  
rails generate devise MODEL(in our application USER)  
rake db:migrate  

'In config/environments/development.rb' :
					config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }  

'In ANY CONTROLLER(or APPLICATION CONTROLLER)' :
					before_action :authenticate_user!

'In MODEL(here in USER model)' :
					devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable, :omniauthable

'In ROUTES' :
					devise_for :users

###### Strategy to authenticate with Google

+ gem 'omniauth-google-oauth2'  
+ bundle install  
+ Go to 'https://console.developers.google.com'  
+ Select your project.  
+ Click 'APIs & auth'(APIs)
+ Make sure "Contacts API" and "Google+ API" are on.  
+ Click 'APIs & auth'(credentials)  
+ Note 'CLIENT ID' and 'CLIENT SECRET'
+ Go to Consent Screen, and provide an 'EMAIL ADDRESS' and a 'PRODUCT NAME'  
+ Wait 10 minutes for changes to take effect.  

'In ROUTES' :

				devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks' }

'IN CONTROLLER'(OmniauthCallbacks):

				class OmniauthCallbacksController < Devise::OmniauthCallbacksController
				  def google_oauth2
				    # You need to implement the method below in your model (e.g. app/models/user.rb)
				    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

				    if @user.persisted?
				      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
				      sign_in_and_redirect @user, :event => :authentication
				    else
				      session["devise.google_data"] = request.env["omniauth.auth"]
				      redirect_to new_user_registration_url
				    end
				  end

				end

'In MODEL'(USER) :
				class User < ActiveRecord::Base
				  devise :database_authenticatable, :registerable,
					 :recoverable, :rememberable, :trackable, :validatable,
					 :omniauthable, :omniauth_providers => [:google_oauth2]

				  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
				    data = access_token.info
				    user = User.where(:email => data["email"]).first

				    # Uncomment the section below if you want users to be created if they don't exist
				    if user.blank?
					user = User.new(email: data["email"],
					   password: Devise.friendly_token[0,20]
					)
				      user.save!
				    end

				    user
				  end

				end  

###### Settings  

'In Production Environment'  

			config.action_mailer.default_url_options = { host: 'sm-sample-application.herokuapp.com'}   
			  config.action_mailer.perform_deliveries = true  
			  config.action_mailer.raise_delivery_errors = true  
			  config.action_mailer.delivery_method = :smtp  
			  config.action_mailer.smtp_settings = {  
			      address: 'smtp.gmail.com',  
			      port: 587,  
			      user_name: 'sajjadmurtaza.nxb@gmail.com',  
			      password: '0123******', 
			      authentication: 'plain',  
			      enable_starttls_auto: true  
			  }  

+ In Production => config.action_mailer.default_url_options = { host: 'localhost', port: 3000}  
+ [Documentation also here](http://www.peoplecancode.com/en/tutorials/how-to-manage-users-with-devise-ruby-on-rails)  

```


