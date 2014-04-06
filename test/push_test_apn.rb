require 'houston'
require 'json'

$apn_prod = Houston::Connection.new(Houston::APPLE_DEVELOPMENT_GATEWAY_URI, File.read('/Users/lm/Desktop/apn_prod2.pem'), 'luka')

message = {"targets"=>[{"type"=>"APN", "deviceIdentifier"=>"ee0378d9d6d0402c051f345581ba098a12d4be442e6c777148512a500f7d342f"}], "payload"=>{"collectionID"=>"52012ae96077890026000001", "type"=>"bidding", "meta"=>{"itemID"=>"51e68bed13585046ef000003", "sellerID"=>"51e68be813585046ef000001", "buyerID"=>"51e69b9ae361db0020000001"}, "messages"=>[{"messageID"=>"52020c178e79ab0019000001", "authorID"=>"51e69b9ae361db0020000001", "authorName"=>"Goonbee Development", "type"=>"text", "payload"=>"And again", "updatedDate"=>nil}]}, "alert"=>"Production message from Goonbee", "topic"=>"52012ae96077890026000001"}
target = message['targets'][0]


notification = Houston::Notification.new(:device => 'ee0378d9d6d0402c051f345581ba098a12d4be442e6c777148512a500f7d342f')
notification.alert = message['alert']
# notification.badge = message['badge'] if message['badge']#up in the future
# notification.sound = message['sound'] if message['sound']#up in the future

#payload
payload = {
	:cID => message['payload']['collectionID'],
	:iID => message['payload']['meta']['itemID'],
	:t => message['payload']['type']
}
notification.custom_data = {:p => payload}

#foo kill
puts notification.message

#get the relevant connection
connection = $apn_prod

#send it off
connection.open
connection.write(notification.message)
puts 'sent push!'
connection.close
