# encoding: UTF-8

# sms_job.rb
# GBPushNotificationsService
#
# Created by Luka Mirosevic on 06/11/2013.
# Copyright (c) 2013 Goonbee. All rights reserved.

module GBPushNotificationsService
  class SMSJob
    #Sample:

    # {
    #     "targets": [                  (required)
    #         "+436645412000",
    #         "+14153334444"
    #     ],
    #     "message": "Hello World!",    (required)
    # }
    
    @queue = :sms
  end
end
