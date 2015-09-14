require './helper.rb'

def create_user
	user_helper = Wangpc::UserHelper.new
	ret = user_helper.create_user('wangpc_test_199', '18601199669', '123123', 'wangpc', '127.0.0.1', '10')
	puts ret
	
end


def buy
end


def withdraw
end


def charge
	
end

def sell
end


def account_verify
end


