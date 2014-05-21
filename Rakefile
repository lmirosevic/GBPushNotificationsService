# encoding: UTF-8

# Rakefile
# GBPushNotificationsService
#
# Created by Luka Mirosevic on 06/11/2013.
# Copyright (c) 2013 Goonbee. All rights reserved.

require 'resque/tasks'
require 'resque'
require './lib/push/push.rb'
require './lib/sms/sms.rb'
require './lib/email/email.rb'

require 'newrelic_rpm'

task 'resque:setup' => :dotenv do
  Resque.redis = Redis.new(url: ENV['RESQUE_REDIS_URI'])
  # Resque.redis.namespace = "resque:push"

  ENV['QUEUES'] = 'email,push,sms'

  GBPushNotificationsService::Push.connect
  GBPushNotificationsService::SMS.connect
  GBPushNotificationsService::Email.connect
end
