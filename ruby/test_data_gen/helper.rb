require './conf.rb'

module Wangpc

	class HTTPHelper
	
		def initialize
		end

		def send_get
		end

		def send_post
		end
		
		 
	end



	class DBHelper

		def initialize
		end


		def db_write
		end
	end

	class Tester
		def initialize
			puts 'Test init.'
		end

		def do
			puts Wangpc::TEST
		end
	end

end
