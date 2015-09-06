require 'httparty'

# response = HTTParty.get('HTTP://127.0.0.1:4567')
# puts response.body, response.code, response.message, response.headers.inspect

# puts "*******************"

res = HTTParty.post('http://127.0.0.1:4567', {:body => {
	username: "wangpc_test_112233",
	phone: "18601199666",
	pass: "1qaz_OKM",
	invitorid: "wangpc",
	ip: "127.0.0.1",
	sourcetype: "10",
	}
})

puts res.body, res.code, res.message, res.headers.inspect
