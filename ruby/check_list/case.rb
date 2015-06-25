require 'watir'

bw = Watir::Browser.new :chrome

bw.goto 'http://www.ezubo.com'

begin
	# case 1, login
	bw.goto 'http://www.ezubo.com/member/common/login'
	bw.text_field(:name, 'sUserName').set 'wangpc'
	bw.element(:id, 'login_main').click
	bw.text_field(:name, 'sPassword').set '123123'
	bw.text_field(:name, 'sVerCode').set '1111'
	bw.element(:id, 'login_main').click
	bw.button(:class, 'btn_login submit').click

rescue => e
	puts e.to_s
	bw.close
end