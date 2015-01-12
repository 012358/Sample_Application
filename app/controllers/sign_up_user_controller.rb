class SignUpUserController < ApplicationController

  def index
    @users=User.all
  end
end
