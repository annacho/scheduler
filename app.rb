require 'sinatra'

get "/fave_tasks" do
	@fave_tasks = FaveTask.fave_tasks
	erb :"fave_tasks/index" # super important to publish!
end

post "/fave_tasks" do 
	text = params[:notes]
	if FaveTask.add_to_fave_tasks(text)
		redirect "/fave_tasks"
	else
		redirect "/error"
	end
end

get "/error" do
	@fave_tasks = FaveTask.fave_tasks
	erb :"/error/error"
end

class FaveTask
	@@fave_tasks = ["Example: Do laundry", "Example: Do long workout"]

	def initialize
	end

	def self.fave_tasks
		@@fave_tasks
	end

	def self.add_to_fave_tasks(fave_task)
		if fave_task.downcase == "be mean to myself"
			return false
		else
			@@fave_tasks << fave_task
		end
	end

end