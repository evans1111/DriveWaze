class NotificationsController < ApplicationController
  require 'twilio-ruby'

    def notify_host
      @client = Twilio::REST::Client.new(ENV["Twilio_sid"], ENV["twil_token"])

      message = @client.messages.create(
        body: 'Your DriveWaze spot has been booked!',
        to: "+17869421330",
        from: '+17864606776',
      )

      puts message.sid
    end

  end
