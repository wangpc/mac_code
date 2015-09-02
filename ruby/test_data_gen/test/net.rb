require 'httparty'

response = HTTParty.get('HTTP://127.0.0.1:4567')
puts response.body, response.code, response.message, response.headers.inspect

puts "*******************"

res = HTTParty.post('http://127.0.0.1:4567', {:body => {aaa: "test"}})

puts res.body, res.code, res.message, res.headers.inspect
