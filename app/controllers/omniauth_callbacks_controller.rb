class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    @user = User.find_for_oauth(request.env['omniauth.auth'], current_user)

    if @user.persisted?
      if @user.email[0..5]=='sajjad'
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        sign_out @user
        flash[:alert] = "You are not allowed here. Naughty boy ;)"
        redirect_to new_user_session_path
      end
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      session['provider']= request.env['omniauth.auth']
      redirect_to new_user_session_path
    end

  end

  alias_method :google_oauth2, :all
  alias_method :twitter, :all
  alias_method :facebook, :all
  alias_method :linkedin, :all
  alias_method :github, :all
end

