# encoding: utf-8

require 'sinatra'
# require 'markaby'
$NOW = File.dirname(__FILE__)
require $NOW + '/helper.rb'


$M = DBModel.new

get '/' do
	send_file $NOW + '/../html/index.html'
end

get '/new_dr' do
	send_file $NOW + '/../html/dailyReport.html'
end


get '/dr' do
	# send_file $NOW + '/../html/dailyReport.html'
	# show the today's report
	show_today $M

end


post '/dr' do
	# params[:report]
	# report 2 db
	rep = params[:report]
	name = get_name_from_id params[:name]
	report_2_db $M, rep, name
	'Submit OK'
end

post '/show_my_dr' do
	who = params[:who_am_i]
	show_my_dr((get_name_from_id who), $M)
end

get '/dp' do 
	send_file $NOW + '/../html/datapool.html'
end















