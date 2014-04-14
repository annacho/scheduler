require 'rspec'
require './app.rb'

describe FaveTask do
	it 'should have favorite tasks' do
		FaveTask.fave_tasks.should_not be_empty
	end

	it 'should add a favorite task' do
		first_count = FaveTask.fave_tasks.count # counts before adding a task
		fave_task = "Brush Teeth" # created after the class method to specify what task 
		FaveTask.add_to_fave_tasks(fave_task) # class method created to add to do task "brush teeth"; adds task
		second_count = FaveTask.fave_tasks.count

		second_count.should > first_count # go to app.rb to add the class method that you want
	end		
end