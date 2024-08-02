class Task
    attr_reader :id
    attr_accessor :description, :completed
  
    @@next_id = 1
  
    def initialize(description)
      @id = @@next_id
      @@next_id += 1
      @description = description
      @completed = false
    end
  
    def to_s
      status = @completed ? "[X]" : "[ ]"
      "#{@id}. #{status} #{@description}"
    end
  end


class TaskManagement

    def initialize
        @tasks = []
    end

    def add(description)
        task = Task.new(description)
        @tasks << task
        puts "Task description added #{task}"
    end

    def list
        @tasks.each do |task|
            puts task
        end
    end

    def complete(task_id)
        task = @tasks.find { |t| t.id == task_id }
        task.completed = true
        puts "Task #{task_id} marked as completed"
    end

    def delete(task_id)
        @tasks.reject! { |t| t.id == task_id }
        puts "Task with #{task_id} is deleted"
    end
    


end


def print_menu
    puts "\n--- Task Manager ---"
    puts "1. Add task"
    puts "2. List tasks"
    puts "3. Complete task"
    puts "4. Delete task"
    puts "5. Exit"
    print "Choose an option: "
  end
  
  task_manager = TaskManagement.new
  
  loop do
    print_menu
    choice = gets.chomp.to_i
  
    case choice
    when 1
      print "Enter task description: "
      description = gets.chomp
      task_manager.add(description)
    when 2
      task_manager.list
    when 3
      print "Enter task ID to mark as complete: "
      id = gets.chomp.to_i
      task_manager.complete(id)
    when 4
      print "Enter task ID to delete: "
      id = gets.chomp.to_i
      task_manager.delete(id)
    when 5
      puts "Goodbye!"
      break
    else
      puts "Invalid option. Please try again."
    end
  end