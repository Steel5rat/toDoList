
DB = SQLite3::Database.open("todo.db")
DB.results_as_hash = true;

class Task
  attr_reader :name, :done, :id
  def initialize ( name, done=false, id=nil)
    @id = id
    @name = name
    @done = done
  end

  def save
    DB.execute("INSERT INTO todo (id , name , done) VALUES (#{@id.nil? ? 'null' : @id},'#{@name}','false');")
  end

  def self.all
    DB.execute("SELECT * FROM todo;").map {|row| Task.new( row['name'],row['done'],row[3],) }
  end

  def to_s
    "#{@id} #{@name} #{@done}"
  end

  def self.task_done
    all
    puts "enter id to mod"
    i = gets.chomp.to_i
    DB.execute("update todo  set done=1 where id=#{i};")
    all
  end
end