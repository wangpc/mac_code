# encoding: utf-8

require 'sqlite3'

def get_name_from_id id
	name_list = {
		'1001' => 'Liu Wangqiang',
		'1002' => 'Qian Xianghua',
		'1003' => 'Wang Pengcheng',
		'1004' => 'Zhu Zhengyi',
		'1005' => 'Duan Liwei',
		'1006' => 'Lv Jing',
		'1007' => 'Fu Yan',
		'1008' => 'Xie Yangyang',
		'1009' => 'Zhang Dandan',
		'1010' => 'Ao Sibo',
		'1011' => 'Zhao Min',
		'1012' => 'Liu Jingai',
		'1013' => 'Chen Ruoxi'
	}

	name_list[id.to_s]

end

def report_2_db db_handler, sreport, name
	if sreport.include? '^^' then
		reports = sreport.split('^^')
		reports.each do |single_rp|
			rre = single_rp.split('|')
			db_handler.insert_new_dr rre, name
		end
	else
		rre = sreport.split('|')
		db_handler.insert_new_dr rre, name
	end
			
end

class DBModel
	def initialize
		@db = SQLite3::Database.new(File.dirname(__FILE__)+'/../db/site.db')
	end
	
	def insert_new_dr dr_arr, name
		sql = <<-EOS
		INSERT INTO DAILY_REPORT (CONTENT, FINISHED, UNFINISHED, PROBLEM, SOLVED, DEADLINE, NEXT, NAME) 
		VALUES ('#{dr_arr[0]}','#{dr_arr[1]}','#{dr_arr[2]}','#{dr_arr[3]}','#{dr_arr[4]}','#{dr_arr[5]}','#{dr_arr[6]}','#{name}') 
		EOS

		@db.execute sql
	end


	def get_today 
		today = Time.now.strftime("%Y-%m-%d")
		start = today.to_s + ' 00:00:00'
		endat = today.to_s + ' 23:59:59'
		sql = <<-EOS
		select * from daily_report where date >= '#{start}' and date <= '#{endat}'
		EOS
		ret = @db.execute sql
		ret
	end

	def get_my my_name
		sql = <<-EOS
		select * from daily_report where name = '#{my_name}' order by date desc;
		EOS
		puts sql
		ret = @db.execute sql
		ret
	end

	


end


def show_today db_handler
	part1 = ''
	File.open(File.dirname(__FILE__)+'/html1','r') do |ff|
		while line = ff.gets
			part1 += line
		end
	end

	part2 = ''
	
	File.open(File.dirname(__FILE__)+'/html2','r') do |ff|
		while line = ff.gets
			part2 += line
		end
	end
	data = ''
	get = db_handler.get_today
	if get.length >= 1 then
		get.each do |rec|
			data += '<tr>'
			data += '<td>' + rec[0].to_s + '</td>'
			data += '<td>' + rec[2] + '</td>'
			data += '<td>' + rec[3] + '</td>'
			data += '<td>' + rec[4] + '</td>'
			data += '<td>' + rec[5] + '</td>'
			data += '<td>' + rec[6] + '</td>'
			data += '<td>' + rec[7] + '</td>'
			data += '<td>' + rec[8] + '</td>'
			data += '<td>' + rec[9] + '</td>'
			data += '</tr>'
		end
	else
		
	end
	html = part1 + data + part2
	return html
end


def show_my_dr my_name, db_handler
	part1 = ''
	File.open(File.dirname(__FILE__)+'/html3','r') do |ff|
		while line = ff.gets
			part1 += line
		end
	end

	part2 = ''
	
	File.open(File.dirname(__FILE__)+'/html2','r') do |ff|
		while line = ff.gets
			part2 += line
		end
	end
	data = ''
	get = db_handler.get_my my_name
	if get.length >= 1 then
		get.each do |rec|
			data += '<tr>'
			data += '<td>' + rec[0].to_s + '</td>'
			data += '<td>' + rec[2] + '</td>'
			data += '<td>' + rec[3] + '</td>'
			data += '<td>' + rec[4] + '</td>'
			data += '<td>' + rec[5] + '</td>'
			data += '<td>' + rec[6] + '</td>'
			data += '<td>' + rec[7] + '</td>'
			data += '<td>' + rec[8] + '</td>'
			data += '<td>' + rec[9] + '</td>'
			data += '<td>' + rec[1] + '</td>'
			data += '</tr>'
		end
	else
		
	end
	html = part1 + data + part2
	return html
end
