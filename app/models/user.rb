class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :calendars
  has_many :calendar_users

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # users to be created if they don't exist
    if user.blank?
        user = User.new(email: data["email"],
           password: Devise.friendly_token[0,20]
        )
      user.save!
    end

    user
  end

end
