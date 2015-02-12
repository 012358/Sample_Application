## SM-Sample_Application
This Sample_Application covered all basic concepts. [Click for Live Demo](https://sm-sample-application.herokuapp.com/)

#### Slider(bxslider-rails)
[Documentation](https://github.com/manfe/bxslider-rails)  
[Live Demo](http://bxslider.com/)  

+ [In sm-sample-application search in following files](https://sm-sample-application.herokuapp.com/)  
+ Defaults

###### How To Implement

```javascript
gem 'bxslider-rails'  
bundle install  
'application.js must appear like': 
			//= require jquery
			//= require jquery_ujs
			//= require bxslider

'stylesheets/application.css like this':
			*= require_self
			*= require bxslider
			*= require_tree .

'In View':
			.bxslider
			      = image_tag '1.png'  
			      = image_tag '2.png'  

'In coffee script' :
			$(document).ready ->
			  $(".bxslider").bxSlider  
			    auto: true  
			    autoControls: true  


```
#### Calendar(Full Calendar Plugin)  
[Calendar view like Full Calendar](http://fullcalendar.io)  
(FullCalendar is for displaying events, and it is a solution for event content-management. Beyond dragging an event to a different time/day, you can change an event's name, etc. )  
+ You can add Calendar(e.g Test-Calendar 1), Every calendar has color
+ Add Events for particular Calendar, Events have different color.  
+ [In sm-sample-application search in following files](https://sm-sample-application.herokuapp.com/)  
1. Calendars  
2. Events  

###### How To Implement

```javascript
gem 'fullcalendar-rails'  
bundle install  
'In your application.css.scss':  
			*= require fullcalendar

'In application.js':  
			//= require fullcalendar
			//= require gcal
			//= require fullcalendar/gcal
'In application.js the try to follow this sequence'  
			//= require moment
			//= require jquery
			//= require jquery_ujs
			//= require turbolinks
			//= require fullcalendar
			//= require fullcalendar/gcal

'In html file'  
		#calendar').fullCalendar();

'In coffee file(events.coffee.js)'  
		    eventSources: [
		      {
			url: '/events.json',  
			type: 'GET',
			allDay: false,
			color: 'red'
			borderColor: '#bccee0',
			textColor: 'black'
			error: ->
			  alert('there was an error while fetching events!')  
		      }
		      {
			url: 'https://www.google.com/calendar/feeds/od305bghpa8fvhjoksdg31glro%40group.calendar.google.com/public/basic'
			color: '#166BEC'
			textColor: '#FFB504'
		      }
```

#### Taggable(Select2)
[Taggable View Like Demo Select2](https://select2.github.io/examples.html)  
(Select2 add a form field which can auto fill text & can take multiple tabs(similar to fb) and gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options.). Here in our application  
+ Multiple attribute show in select2 field
+ You can choise and search from dropdown and also add new which is not predefined in select2 dropdown.   
+ [In sm-sample-application search in following files](https://sm-sample-application.herokuapp.com/)  
1. TaggingSelectTos

###### How To Implement  
 
```javascript
gem "select2-rails"  
'In app/assets/javascripts/application.js': 
				//= require select2

'In app/assets/stylesheets/application.css':
				*= require select2
```

```javascript
'If multiple:true, then you can use this way'  

'In Form'  
		<%= f.text_field :name, class: "single-taggable-field",data: {options: Enumeration.pluck(:name)}, placeholder: 'Enter Name' %>
 
'In coffee'  
		$(".single-taggable-field").select2(  
		    tags: $('.single-taggable-field').data('options')  
		    width: "252px"  
		  );  
In tags: actaully there is array  
like  
tags: [sajjad, moin]  

```

```javascript

'If multiple:false, then use this way'  

		<%= f.text_field :calendar_id, class: "single-field",data: {options: Calendar.all} %>  

		$('.single-field').each ->  
		    $(this).select2  
		      data: $(this).data('options')  
		      width: "252px"  
		      multiple: false  

```

```javascript

'In MODEL':
	 		def as_json(options= {})  
    				{id: self.id, text: self.name}  
  			end  
```
#### Nested forms(cocoon)
[Cocoon Documentation](https://github.com/nathanvda/cocoon)  
(Make dynamic nested forms). In Our application
+ Add multiple task(form) against project.  
```javascript
gem "cocoon"  

```
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

```javascript
'For download PDF'  
'In Controller'  
		pdf = render_to_string :pdf => 'sajjad',  
                             template: 'billings/show.pdf.slim',  
                             :encoding => 'UTF-8'  
      		send_data(pdf, :filename => @bill.title,  :type=>'application/pdf')  
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
```
```javascript

'In CONTROLLER' :

			def new
		    	   @enumeration = Enumeration.new(type: params[:type])
		        end
```

```javascript

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

```

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

```javascript

'In ROUTES' :

				devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks' }

```

```javascript

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
```

```javascript

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

```

###### Settings

```javascript

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
```
+ In Development Environment => config.action_mailer.default_url_options = { host: 'localhost', port: 3000}  
+ [Documentation also here](http://www.peoplecancode.com/en/tutorials/how-to-manage-users-with-devise-ruby-on-rails)  

#### Chart(GetOrgChart)  

[GetOrgChart Documentation](http://www.getorgchart.com/Documentation)  
(Provides the best way to visualize and understand workforce by simple and easy to illustrate hierarchical relationships.)[Github](https://github.com/mirfan899/org_chart)  
+ In Our application  
+ Organizedata  

###### How To Implement

```javascript
gem "org_chart", "~>0.0.3"  
bundle install  

'In app/assets/javascripts/application.js': 
			//= require getorgchart

'In app/assets/stylesheets/application.css':
			*= require getorgchart  

+ Load from HTML table element.[demo](http://jsfiddle.net/GetOrgChart/7RKTv/)  


```
OR  

```javascript
+ getorgchart.js(javascript)  
+ getorgchart.css(stylesheet)  
+ org_chart.png(images)  
+ if icon not show try this => asset-url("org_chart.png") replcae with url('org_chart.png')  
```



