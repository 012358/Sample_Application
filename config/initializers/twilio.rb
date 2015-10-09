require 'rubygems'
require 'twilio-ruby'

account_sid = 'AC20aef60110fea26f6ba10374ede11cbd'
auth_token = 'f8a93cc98d52c2c3c19fa290d141d6da'


TWILIO_CLIENT = Twilio::REST::Client.new account_sid, auth_token