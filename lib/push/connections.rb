# encoding: UTF-8

# connections.rb
# GBPushNotificationsService
#
# Created by Luka Mirosevic on 06/11/2013.
# Copyright (c) 2013 Goonbee. All rights reserved.

require 'houston'
require 'gcm'

module GBPushNotificationsService
  class Push
    def self.connect
      # Apple Push Notifications Service
      # @@apn_dev = Houston::Connection.new(Houston::APPLE_DEVELOPMENT_GATEWAY_URI, File.read(ENV['APN_DEV_CERTIFICATE']), ENV['APN_DEV_PASSPHRASE'])
      @@apn_prod = Houston::Connection.new(Houston::APPLE_PRODUCTION_GATEWAY_URI, File.read(ENV['APN_PROD_CERTIFICATE']), ENV['APN_PROD_PASSPHRASE'])  unless ENV['APN_PROD_CERTIFICATE'].nil?

      # Google Cloud Messaging
      @@gcm = GCM.new(ENV['GCM_API_KEY']) unless ENV['GCM_API_KEY'].nil?
    end
  end
end
