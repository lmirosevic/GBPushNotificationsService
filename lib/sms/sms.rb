# encoding: UTF-8

# sms.rb
# GBPushNotificationsService
#
# Created by Luka Mirosevic on 06/11/2013.
# Copyright (c) 2013 Goonbee. All rights reserved.

require 'twilio-ruby'

require_relative 'sms_job'
require_relative 'connections'

module GBPushNotificationsService
  class SMSJob
    def self.perform(message)
      SMS.send(message)
    end
  end

  class SMS
    def self.send(message)
      #logging
      puts message

      #verify the query
      required_fields = ['targets', 'message']
      required_fields.all? { |e| message.include?(e) } or raise StandardError('SMS message didn\'t contain all required fields')

      #get the targets
      targets = message['targets']

      if targets.count > 0
        targets.each do |target|
          begin
            @@twilio_client.account.messages.create(
              :from => @@twilio_number,
              :to => target,
              :body => message['message']
            ) 
          rescue Twilio::REST::RequestError => e
            puts e
          end
        end
      end
    end
  end
end
