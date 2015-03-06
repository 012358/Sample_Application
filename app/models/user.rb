class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2, :twitter, :facebook, :linkedin, :github]

  has_many :calendars
  has_many :calendar_users

  validates_presence_of :email

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    p '&&&&&&&&&&&&'

    p data = access_token.info
    p '&&&&&&&&&&&&'
    p data.nickname
    p '&&&&&&&&&&&&'

    if access_token.provider == "twitter"
      user = User.where(:email => "#{data["nickname"]}@twitter.com").first
    else
      user = User.where(:email => data["email"]).first
    end


    # users to be created if they don't exist
    if user.blank?
        user = User.new(email: data["email"],
           password: Devise.friendly_token[0,20]
        )

    if access_token.provider == "twitter"
      p '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
      p user.email = "#{data["nickname"]}@twitter.com"
      user.save
    else
      user.save!
    end

    end

    user
  end

end
