# require 'twilio-ruby'
#
#
#
# # put your own credentials here
# account_sid = 'AC0326b107b2f72cb03da6fca712c3c5b5'
# auth_token = '2b77c01d1b2fbd4040cccf903abc4c5c'
#
# # set up a client to talk to the Twilio REST API
# @client = Twilio::REST::Client.new(ENV["Twilio_sid"], ENV["twil_token"])
#
# message = @client.messages.create(
#   body: 'hello',
#   to: '+17869421330',
#   from: '+17864606776',
# )
#
# puts message.sid
