require 'sqlite3'
require './lib/task'
#address_book_db.execute("INSERT INTO todo (name) VALUES ('Ales');")
#address_book_db.results_as_hash = true;
#contacts = address_book_db.execute("SELECT * FROM todo;")
#contacts.each { |el| p el}


def tasks
  choice = nil
  until choice=='e'
    puts("'l' to list tasks, 'a' to add task, 'd' to mark task as done, press 'exit' to exit, ")
    choice = gets.chomp
    case choice
      when 'exit'
          choice='e'
      when 'l'
        listTasks
      when 'a'
        addTask
      when 'd'
        taskDone
      else
        invalid
    end
  end
end

def listTasks
  puts "All tasks:"
  tasks = Task.all
  tasks.each {|task| puts task}
end

def addTask
   puts "Type new task:"
   text = gets.chomp
   obj = Task.new (text)
   obj.save
   puts "done"
end

def taskDone
   Task.task_done
end

def invalid
  puts "invaliiiid!!!"
end

tasks