# encoding: UTF-8

# connections.rb
# GBPushNotificationsService
#
# Created by Luka Mirosevic on 06/11/2013.
# Copyright (c) 2013 Goonbee. All rights reserved.

require 'twilio-ruby'

module GBPushNotificationsService
  class SMS
    def self.connect
      #Twilio
      @@twilio_client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_ACCOUNT_TOKEN'])  unless ENV['TWILIO_ACCOUNT_SID'].nil?
      @@twilio_number = ENV['TWILIO_NUMBER']
    end
  end
end
