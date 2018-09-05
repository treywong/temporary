require "sqlite3"

$db = SQLite3::Database.open("todo_list.db")

class List
	def self.add(task)
		$db.execute("INSERT INTO todo (task,added_in_on,complete_status)
			VALUES(?,DATE('NOW'),'[ ]')",task)
	end

	def self.list
		list = $db.execute("SELECT * FROM todo")
		list.each{|s| p s}
	end

	def self.delete_id(task_id)
		$db.execute("DELETE FROM todo WHERE id = ?",
			task_id)
	end

	def self.complete_id(task_id)
		$db.execute("UPDATE todo SET complete_status = '[X]' WHERE id = ?",
			task_id)
	end
end

response = [ARGV[0],ARGV[1..(ARGV.length-1)].join(" ")]

if response[0] == "add"
	List.add(response[1])
elsif response[0] == "list"
	List.list
elsif response[0] == "delete"
	List.delete_id(response[1])
elsif response[0] == "complete"
	List.complete_id(response[1])
end
