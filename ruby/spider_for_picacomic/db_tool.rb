# db tool

require 'sqlite3'

def create_table
	db = SQLite3::Database.new('spider.db')
	sql_create_table = <<-EOS
	CREATE TABLE [COMMIC_LIST] (
		[COMMIC_ID] INTEGER NOT NULL PRIMARY KEY,
		[COMMIC_NAME] TEXT,
		[DESC] TEXT,
		[CATEGORY] INTEGER,
		[AUTHOR] TEXT,
		[IMG_PATH] TEXT,
		[FINISHED] INTEGER,
		[TOTAL_PAGE] INTEGER,
		[EP] INTEGER,
		[COVER_PATH] TEXT,
		[DOWN] TEXT
		);
	EOS
	db.execute sql_create_table
end

def drop_table table_name
	db = SQLite3::Database.new('spider.db')
	sql_drop_table = <<-EOS
	DROP TABLE #{table_name}
	EOS
	db.execute sql_drop_table
end

# create_table
# drop_table 'COMMIC_LIST'
