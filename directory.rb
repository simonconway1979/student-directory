
#First we print the list of students (as an array)



def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" 
    
    # 2. read the input and save it into a variable
    selection = gets.chomp
    
    
    # 3. do what the user has asked
    case selection
    when "1"
      # Input the students
      student = input_students
    when "2"
      # show the students
      print_header
      print(students)
      print_footer(students)
      
    when "9"  
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant. Try again."
    
    end
  end
end





def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :November}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end




#students = [
#{name: "Dr. Hannibal Lecter", cohort: :November},
#{name: "Darth Vader", cohort: :November},
#{name: "Nurse Ratched", cohort: :November},
#{name: "Michael Corleone", cohort: :November},
#{name: "Alex DeLarge", cohort: :November},
#{name: "The Wicked Witch of the West", cohort: :November},
#{name: "Terminator", cohort: :November},
#{name: "Freddy Krueger", cohort: :November},
#{name: "The Joker", cohort: :November},
#{name: "Joffrey Baratheon", cohort: :November},
#{name: "Norman Bates", cohort: :November}
#]

def print_header
puts "The students of Villains Academy"
puts "--------------"
end


def print(students)
students.each_with_index {|student, index| puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)"}
end


def print_footer(students)
puts "Overall, we have #{students.count} great students"
end


interactive_menu
print_header
print(students)
print_footer(students)
