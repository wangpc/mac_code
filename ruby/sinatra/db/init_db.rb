require 'sqlite3'

def init_table
	sql_init = <<-EOS
	CREATE TABLE [DAILY_REPORT](
	[REPORT_ID] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        [DATE] Timestamp DEFAULT (datetime('now','localtime')),
        [CONTENT] TEXT,
        [FINISHED] TEXT,
        [UNFINISHED] TEXT,
        [PROBLEM] TEXT,
       	[SOLVED] TEXT,
	[DEADLINE] TEXT,
	[NEXT] TEXT,
	[NAME] TEXT
	);

	EOS
	db = SQLite3::Database.new('./site.db')
	db.execute sql_init
end

def init_record
	sql = <<-EOS
	INSERT INTO DAILY_REPORT (REPORT_ID, DATE, CONTENT, FINISHED, UNFINISHED, PROBLEM, SOLVED, DEADLINE, NEXT, NAME) 
        VALUES (100000001, '2000-01-01 00:00:00','INIT','INIT','INIT','INIT','INIT','INIT','INIT','INIT');
	EOS
	db = SQLite3::Database.new('./site.db')
 	db.execute sql
end
init_table
init_record
