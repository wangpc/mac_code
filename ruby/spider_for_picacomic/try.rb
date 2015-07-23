require 'json'
require 'sqlite3'

######## DB method #########
db = SQLite3::Database.new('spider.db') # start db
############################

random_res = JSON.parse(`curl -s http://picacomic.com/yoo/v3/comics/random`)
random_res['data'].each do |dt|
	puts "> Now exec id #{dt['id']}"
	sql_query_if_down = <<-EOS
	select * from commic_list where commic_id = #{dt['id']} and down = 'yes';
	EOS
	res_if_down = db.execute sql_query_if_down
	if res_if_down == [] then
		db.execute("INSERT INTO COMMIC_LIST (COMMIC_ID, COMMIC_NAME, DESC, CATEGORY, AUTHOR, IMG_PATH, FINISHED, TOTAL_PAGE, EP, COVER_PATH, DOWN)
		 VALUES (?,?,?,?,?,?,?,?,?,?,?)", [dt['id'].to_i, dt['name'], dt['description'],dt['category_id'].to_i, dt['author'], dt['img_directory'], dt['finished'].to_i, 
		 dt['total_page'].to_i, dt['ep'].to_i, dt['cover'], 'no'])
		puts "> ID #{dt['id']} is a new one, create new record."
	else
		puts "> ID #{dt['id']} already downloaded, skip this id."
		next
	end
	ep.to_i.times do |ep_time|
		puts ">> exec ep #{ep_time}"
		`mkdir -p ./#{dt['id']}/#{ep_time}`
		puts ">> mkdir ./#{dt['id']}/#{ep_time}"
		pic_list = JSON.parse(`curl -s http://picacomic.com/yoo/v3/comics/#{dt['id']}/ep/#{ep_time + 1}`)
		pic_list['data'].each_with_index do |ll, index|
			print ">>> Download ep #{ep_time} page #{index}..."
			`wget -q --tries=3 --directory-prefix=\'./#{dt['id']}/#{ep_time}\' #{ll['url']}`
			print "Done. \n"
		end
	end
	sql_update = <<-EOS
	update COMMIC_LIST set DOWN = 'yes' where COMMIC_ID = #{dt['id']};
	EOS
	db.execute sql_update
	puts "> ID #{dt['id']} has been download finished."


	
end

