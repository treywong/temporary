require 'sqlite3'

$db = SQLite3::Database.new"todo_list.db"

module ToDoDB
	def self.setup
		$db.execute(
			<<-SQL
			CREATE TABLE todo (
				id INTEGER PRIMARY KEY AUTOINCREMENT,
				task VARCHAR(128) NOT NULL,
				added_in_on DATE NOT NULL,
				complete_status VARCHAR(64) NOT NULL
			);
			SQL
		)
	end

	def self.seed
		# Add a few records to your database when you start
		$db.execute(
			<<-SQL
			INSERT INTO todo
				(task,added_in_on,complete_status)
			VALUES
				('Bake a delicious blueberry-glazed cheesecake', DATE('now'),'[ ]'),
				('Go play miniature golf with Mike Tyson', DATE('now'),'[ ]'),
				('Become a World-Class Developer', DATE('now'),'[ ]');
			SQL
		)
	end
end
ToDoDB.setup
ToDoDB.seed