require 'uri'
require 'net/http'

url = URI("http://i.ezubo.com/Debt/index?invest_id=104988&paypass=123123&uid=557421&ref=0")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["content-type"] = 'multipart/form-data; boundary=---011000010111000001101001'
request.body = "-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"borrow_id\"\r\n\r\n1060\r\n-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"money\"\r\n\r\n11\r\n-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"pin\"\r\n\r\n123123\r\n-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"putuserid\"\r\n\r\n38\r\n-----011000010111000001101001--"

response = http.request(request)
puts response.read_body
