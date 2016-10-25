
@students = [] #An empty array accessible by all methods

#First we print the list of students (as an array)


def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end


def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

  def print_menu
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list of students to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit" 
  end
    
    # 2. read the input and save it into a variable
    selection = gets.chomp

    def print_header
    puts "The students of Villains Academy"
    puts "--------------"
    end


    def print_student_list
    @students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
    end


    def print_footer
      puts "Overall, we have #{@students.count} great students"
    end

    
    # 3. do what the user has asked
  def process(selection)
    case selection
    when "1"
     input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"  
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant. Try again."
    end
  end



    def input_students
      puts "Please enter the names of the students"
      puts "To finish, just hit return twice"
      name = gets.chomp
      while !name.empty? do
        @students << {name: name, cohort: :November}
        puts "Now we have #{@students.count} students"
        name = gets.chomp
      end
    end
    
    def show_students
      # show the students
      print_header
      print_student_list
      print_footer
    end
    
    def save_students
      #open the file for writing
      file = File.open("students.csv", "w")
      # iterate over the array of students
      @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
      end
      file.close
    end

    interactive_menu






