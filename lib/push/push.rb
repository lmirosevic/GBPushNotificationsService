# encoding: UTF-8

# push.rb
# GBPushNotificationsService
#
# Created by Luka Mirosevic on 18/07/2013.
# Copyright (c) 2013 Goonbee. All rights reserved.

require 'houston'
require 'gcm'

require_relative 'push_job'
require_relative 'connections'

module GBPushNotificationsService
  class PushJob
    def self.perform(message)
      Push.push(message)
    end
  end

  class Push
    def self.push(message)
      # logging
      puts message

      # verify the query
      required_fields = ['targets', 'alert', 'payload']
      required_fields.all? { |e| message.include?(e) } or raise StandardError('Push message didn\'t contain all required fields')

      # get the targets
      targets = message['targets']

      # make sure we have at least 1 target
      if targets.count > 0

        # Apple APN
        targets.each do |target|# send to each Apple target separately, we have an open connection so it's fine
          if target['type'] == 'APN'

            # construct the payload
            notification = Houston::Notification.new(device: target['deviceIdentifier'])

            notification.alert = message['alert']
            notification.badge = message['badge'] if message['badge']
            notification.sound = message['sound'] || 'default'
            notification.custom_data = { p: message['payload'] } if message['payload']

            # get the relevant connection
            connection = @@apn_prod

            # send it off
            connection.open# up, try hoisting the connectin opening and closing out of this each loop, so multiple notificaitons can be sent down a single connection
            connection.write(notification.message)
            connection.close
          end
        end

        # Google GCM
        if targets.any? { |target| target['type'] == 'GCM' }
          registration_ids = targets.select{ |target| target['type'] == 'GCM' }.map{ |target| target['deviceIdentifier'] }# send to all targets in one go

          options = {}

          options[:collapse_key] = message['topic'] unless message['topic'].nil?

          if message['payload'] || message['alert']
            data = {}
          
            data[:p] = message['payload'] if message['payload']
            data[:alert] = message['alert'] if message['alert']
            data[:badge] = message['badge'] if message['badge']

            options[:data] = data
          end

          # send it off
          @@gcm.send_notification(registration_ids, options)
        end
      end
    end
  end
end
