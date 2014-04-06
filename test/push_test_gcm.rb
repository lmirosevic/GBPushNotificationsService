#!/usr/bin/ruby

######################## SETUP ########################
API_KEY = '<insert GCM API KEY HERE>'
REGISTRATION_ID = '<insert Android device registration ID here>'
#######################################################

#get gem
require 'gcm'

#connect to Google
gcm = GCM.new(API_KEY)

#something like this comes down from API into push service
message = {
    "payload"=> {
        "collectionID"=>"51e99480135850cdca00000a",
        "type"=>"bidding",
        "meta"=> {
            "itemID"=>"51e991d5135850cdca000002",
            "sellerID"=>"51b8961c13585027c4000001",
            "buyerID"=>"51b98e7813585010dc000001"
        },
        "messages"=> [{
            "messageID"=>"51e99493135850cdca00000c",
            "authorID"=>"51b98e7813585010dc000001",
            "authorName"=>"Goonbee Development",
            "type"=>"text",
            "payload"=>"Hey mister mister",
            "updatedDate"=>nil
        }]
    },
    "alert"=>"Goonbee Development sent you a message.",
    "topic"=>"51e99480135850cdca00000a"
}

#prep notification
options = {
    :data => {
        :payload => message['payload'],
        :alert => message['alert']
    },
    :collapse_key => message['topic']
}

#send notification
response = gcm.send_notification([REGISTRATION_ID], options)

print "Push notification sent, got response...\n"
puts response


=begin Sample:
{
    "data": {
        "p": [1, "b", "123", "456"],
        "alert": "Goonbee Development sent you a message."
    },
    "collapse_key": "51e99480135850cdca00000a"
}
=end
