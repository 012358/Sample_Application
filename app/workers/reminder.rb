class Reminder
  include Sidekiq::Worker
  sidekiq_options queue: 'reminder'
  sidekiq_options :retry => false

  def perform(event)
    TWILIO_CLIENT.account.messages.create({
                                              :from => '+19187169455',
                                              :to => '+923427852184',
                                              :body => event.description
                                          })
  end
end