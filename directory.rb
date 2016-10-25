
@students = [] #An empty array accessible by all methods

#First we print the list of students (as an array)


def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end


def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first argument from teh command line
  return if filename.nil? #get out of the method if no filename is given
  if File.exists?(filename) #If the file exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #If the file does not exist
    puts "Sorry, #{filename} does not exist"
    exit #Quits the program
  end
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
    selection = STDIN.gets.chomp

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
      name = STDIN.gets.chomp
      while !name.empty? do
        @students << {name: name, cohort: :November}
        puts "Now we have #{@students.count} students"
        name = STDIN.gets.chomp
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


    try_load_students
    interactive_menu






