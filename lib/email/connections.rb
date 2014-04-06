# encoding: UTF-8

# connections.rb
# GBPushNotificationsService
#
# Created by Luka Mirosevic on 04/02/2014.
# Copyright (c) 2013 Goonbee. All rights reserved.

require 'mandrill'

module GBPushNotificationsService
  class Email
    def self.connect
      #Mandrill
      @@mandrill = Mandrill::API.new(ENV['MANDRILL_API_KEY']) unless ENV['MANDRILL_API_KEY'].nil?
    end
  end
end
