# encoding: UTF-8

# email.rb
# GBPushNotificationsService
#
# Created by Luka Mirosevic on 04/02/2014.
# Copyright (c) 2013 Goonbee. All rights reserved.

require 'mandrill'

require_relative 'email_job'
require_relative 'connections'

module GBPushNotificationsService
  class EmailJob
    def self.perform(message)
      Email.send(message)
    end
  end

  class Email
    def self.send(message)
      #logging
      puts message

      #verify the query
      required_fields = ['targets', 'from']
      required_fields.all? { |e| message.include?(e) } or raise StandardError('Email message didn\'t contain all required fields')

      #construct the message that mandrill wants
      mandrill_message = {}
      mandrill_message[:to] = message['targets'].map { |e| {email: e} }
      mandrill_message[:subject] = message['subject'] || ''
      mandrill_message[:text] = message['body_text'] unless message['body_text'].nil?
      mandrill_message[:html] = message['body_html'] || ''
      mandrill_message[:from_email] = message['from']
      mandrill_message[:reply_to] = message['reply_to'] unless message['reply_to'].nil?
      mandrill_message[:important] = message['important'] || false

      #send the email
      result = @@mandrill.messages.send(mandrill_message)
      puts result
    end
  end
end
