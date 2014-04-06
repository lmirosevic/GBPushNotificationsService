# encoding: UTF-8

# email_job.rb
# GBPushNotificationsService
#
# Created by Luka Mirosevic on 04/02/2014.
# Copyright (c) 2013 Goonbee. All rights reserved.

module GBPushNotificationsService
  class EmailJob
    #Sample:

    # {
    #     "targets": [                          (required)
    #         "bill@microsoft.com",
    #         "steve@apple.com"
    #     ],
    #     "subject": "Greetings",
    #     "body_text": "Hello World!",
    #     "body_html": "<h1>Hello World!</h1>",
    #     "sender_name": "Goonbee Support",
    #     "from": "no-reply@goonbee.com",       (required)
    #     "reply_to": "luka@goonbee.com",
    #     "important": true,
    # }
    
    @queue = :email
  end
end
