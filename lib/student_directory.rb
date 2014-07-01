require 'date'

def show(string)
   puts string
end

def take_user_input
 	gets.chomp
end

def ask_for_data (info_needed)
	show("Please enter #{info_needed}.")
end


def is_cohort_valid?(string)
	Date::MONTHNAMES.compact.include?(string.downcase.capitalize)
end


def create_student(name, cohort)
	{name: name, cohort: cohort}
end

def students
	@students ||= []
end

def add_student_to_list(new_student)
	students << new_student
end


def get_input (data_type)
	ask_for_data (data_type)
	take_user_input
end

def get_details_of_new_student
	name, cohort = get_inputs(["student's name", "cohort"])
	puts "the input for name is #{name}"
	puts "the input for cohort is #{cohort}"
	create_student(name, cohort)
	# puts "the students are ------ #{students}"
end

def save_student_details? new_student
	show new_student[:name]
	show new_student[:cohort]
end

def get_inputs(input_list)
	input_list.map {|input_type| get_input(input_type)}
end

def print_student_number
	show ("There are #{students.length} students(s) in the directory")	
end


def add_another_student?
	show('Would you like to add a new student ("Y") or finish ("N")')
	selection = take_user_input.upcase
 	process_user_choice(selection)
end

def process_user_choice selection
	case selection
	when "Y"
		new_student = get_details_of_new_student
		add_student_to_list(new_student)
		add_another_student?
	when "N"
		print_student_number
	else
		puts "try again"
		add_another_student?
	end
end
