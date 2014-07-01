require 'student_directory'

describe 'Student directory' do


	it 'takes an input from the user' do
		input = "hello"
		allow(self).to receive(:gets).and_return("hello")
		expect(take_user_input).to eq input
	end

	it 'asks the user for a name' do
		request_name_input = "Please enter student name."
		expect(self).to receive(:show).with(request_name_input)
     	ask_for_data("student name")
     end


     it 'ask the user for cohort' do 
     	request_cohort_input = "Please enter cohort."
     	expect(self).to receive(:show).with(request_cohort_input)
     	ask_for_data('cohort')
     end

     it 'knows that a june cohort is valid' do
     	expect(is_cohort_valid?("june")).to be true
     end

     it 'knows that a banana cohort is not valid' do
     	expect(is_cohort_valid?("banana")).to be false
     end

     it 'creates a student with name and cohort' do 
     	name = "Sarah"
     	cohort = :june
     	new_student = {:name => name, :cohort => cohort}
     	expect(create_student(name,cohort)).to eq new_student
     end

     it 'adds the student to the list' do 
     	new_student = {:name=>"Sarah", :cohort => :June}
     	expect(add_student_to_list(new_student)).to eq [new_student]
     end

     it 'adds another student to the list' do 
     	sarah = {:name=>"Sarah", :cohort => :June}
     	jan = {:name => "Jan", :cohort => :August}
     	add_student_to_list(sarah)
     	expect(students).to eq [sarah]
     	add_student_to_list(jan)
     	expect(students).to eq [sarah, jan]
 	end

 	# it 'gets name' do 
 	# 	#expect(get_name).to receive(:ask_for_name)
 	# 	expect(get_input("student name")).to receive(:take_user_input).and_return("name")
 	# end


 	it 'gets details of new student' do 
 		allow(self).to receive(:get_inputs).and_return(["bob", "june"])
 		expect(get_details_of_new_student).to eq({:name=>"bob", :cohort=>"june"})
 	end

 	it 'get inputs' do 
 		expect(self).to receive(:get_input).exactly(3).times
 		get_inputs(["a","b","c"])
 	end


 	it 'does not ask for a new student when user selests "N"' do
 		allow(self).to receive(:take_user_input).and_return("N")
 		expect(self).not_to receive(:get_details_of_new_student)
 		add_another_student?
 	end

 	it 'keeps asking for new students while user enters "Y"' do
 		name1 = "SomeName"
 		cohort1 = "june"
 		name2 = "AnotherName"
 		cohort2 = "may"
 		allow(self).to receive(:take_user_input).and_return("Y", name1, cohort1, "Y", name2, cohort2, "N")
 		add_another_student?
 		expect(students.count).to eq 2
 		puts students.inspect
 	end

 	it 'counts the number of students when the array is empty when pressed "N"' do
 		allow(self).to receive(:take_user_input).and_return("N")
 		expect(self).to receive(:print_student_number).and_return("There are 0 students(s) in the directory") 
 		add_another_student?
 	end

 	it 'counts the number of students when the array is not empty when pressed "N"' do 
 		sarah = {:name=>"Sarah", :cohort => :June}
     	jan = {:name => "Jan", :cohort => :August}
     	add_student_to_list(sarah)
     	add_student_to_list(jan)
     	allow(self).to receive(:take_user_input).and_return("N")
 		expect(self).to receive(:print_student_number).and_return("There are 2 students(s) in the directory") 
 		add_another_student?
 	end



 end




























