require './conf.rb'

module Wangpc
	class UserHelper
		def initializeUser
			# do sth
		end

		def create_user user_name, phone, pass, invitorid, ip, sourcetype
			# we need user_name/pass/phone/invitorid/ip/sourcetype
			res = HTTParty.post($API_URI, {body: {
				username: user_name,
				phone: phone,
				pass: pass,
				invitorid: invitorid,
				ip: ip,
				sourcetype: sourcetype,
				}})
			return res.body # string

		end
	end

	class AccountHelper
		def initialize
		end

		def balance_change
		end

	end
end
