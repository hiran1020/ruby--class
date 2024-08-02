class Attendance
  attr_reader :student_id
  attr_accessor :student_name, :attendance_records

  @@student_ids = 1

  def initialize(student_name)
    @student_id = @@student_ids
    @@student_ids += 1
    @student_name = student_name
    @attendance_records = false
  end

  def status
    @attendance_records ? "Present" : "Absent"
  end

  def attendance_record(value)
    @attendance_records = value
  end
  

end

class AttendanceManagement
  
    def initialize
        @Attendances = []
    end

    def add_student(student_name)
        student = Attendance.new(student_name)
        @Attendances << student
        puts "#{student_name} added successfully with student id #{student.student_id}."
        puts "--------------------"
    end


    def remove_student(student_id)
        student = @Attendances.find { |s| s.student_id == student_id }
        if student
          @Attendances.delete(student)
          puts "#{student.student_name} removed successfully."
          puts "--------------------"
        else
            puts "Student not found."
            puts "--------------------"
        end
    end

    def display_students
        puts "Student List:"
        @Attendances.each do |student|
          puts "#{student.student_id}. #{student.student_name}"
          puts "--------------------"
        end
        puts "--------------------"
    end

    def record_attendance(student_id,ask)
        student = @Attendances.find { |s| s.student_id == student_id }
        
        if student
            student.attendance_records = ask 
            puts "#{student.student_name}'s attendance has been recorded as #{ask ? "Present" : "Absent" }"
             puts "--------------------"
        else
            puts "Student not found."
            puts "--------------------"
        end
    end
    def search_student(student_name)
        student = @Attendances.find { |s| s.student_name.downcase == student_name.downcase }
        if student
          puts "#{student.student_id} #{student.student_name} is #{student.status}"
          puts "--------------------"
        else
            puts "Student not found."
            puts "--------------------"
        end
    end

end


def print_menu
    puts <<-MENU
    1. Add Student
    2. Remove Student
    3. Display Students
    4. Record Attendance
    5. Search Student Attendance
    6. Exit
    MENU
end



    attendance = AttendanceManagement.new


    loop do
        print_menu
        choice = gets.chomp.to_i

        case choice
        when 1
            puts "Enter Student Name:"
            student_name = gets.chomp
            attendance.add_student(student_name)
        when 2
            puts "Enter Student ID to remove:"
            id = gets.chomp.to_i
            attendance.remove_student(id)
        when 3
             puts "Student List:"
             attendance.display_students
        when 4
            puts "Enter Student ID to record attendance:"
            id = gets.chomp.to_i
            sleep 1
            puts "Enter A for Absent and P for Present"

            asks = gets.chomp.to_s.upcase
            if asks == "A"
                ask = false
            elsif asks == "P"
                ask = true
             else
                puts "Invalid option. Please try again."
            end
            
            attendance.record_attendance(id, ask)
        when 5
            puts "Search Student..."
            puts "Enter Student Name:"
            student_name = gets.chomp
            attendance.search_student(student_name)
        when 6
            puts "Goodbye!"
            break
        else
            puts "Invalid option. Please try again."
      end
  end



