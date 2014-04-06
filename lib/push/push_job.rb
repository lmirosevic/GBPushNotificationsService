# encoding: UTF-8

# push_job.rb
# GBPushNotificationsService
#
# Created by Luka Mirosevic on 18/07/2013.
# Copyright (c) 2013 Goonbee. All rights reserved.

module GBPushNotificationsService
  class PushJob
    #Sample:

    # {
    #     "targets": [                              (required)
    #         {
    #             "type": "APN",
    #             "deviceIdentifier": "123"
    #         }
    #     ],
    #     "alert": "Hello World",                   (required)
    #     "badge": 4,
    #     "sound": "jingle",
    #     "topic": "abc",
    #     "payload": {}                             (required)
    # }

    @queue = :push
  end
end
