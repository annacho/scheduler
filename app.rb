require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///fave_tasks.db"

get "/fave_tasks" do
	@example_tasks = FaveTask.fave_tasks
	@fave_tasks = FaveTask.all
	erb :"fave_tasks/index" 
end

get "/fave_tasks/new" do
	@new_fave_task = FaveTask.new
	erb :"fave_tasks/new"
end

# post "/fave_tasks" do
# 	@fave_task = FaveTask.new(params[:fave_task])
# 	if @fave_task.me
# 		@fave_task.save
# 		redirect "/fave_tasks/#{@fave_task.id}"
# 	else
# 		redirect "/Error"
# 	end
# end

get "/:id" do
	@fave_task = FaveTask.find(params[:id])
	erb :"fave_tasks/show"
end

put "/fave_tasks/:id" do # works to edit or update inputed data
	@fave_task = FaveTask.find(params[:id])
	if @fave_task.update_attributes(params[:fave_task])
		redirect "/fave_tasks/#{@fave_task.id}"
	else
		redirect "/Error"
	end
end

post "/fave_tasks" do # works to add or delete data
	new_fave_task = FaveTask.new
	new_fave_task[:description] = params[:description]
	new_fave_task[:date] = params[:date]
	new_fave_task[:time] = params[:time]
	if new_fave_task.save
		redirect "/fave_tasks"
	else
		redirect "/Error"
	end
end

get "/edit" do
	@fave_tasks = FaveTask.fave_tasks
	erb :"fave_tasks/edit"
end

get "/fave_tasks/:id" do
	@fave_task = FaveTask.find(params[:id])
	erb :"fave_tasks/show"
end

get "/:id/edit" do
	@fave_task = FaveTask.find(params[:id])
	erb :"fave_tasks/edit"
end

get "/error" do
	redirect "/Error"
end

get "/Error" do
	@fave_tasks = FaveTask.fave_tasks
	erb :"fave_tasks/error"
end

delete '/fave_tasks/:id' do
	fave_task = FaveTask.find(params[:id])
	if fave_task.delete
		redirect '/fave_tasks'
	else
		redirect '/fave_tasks/:id'
	end
end

class FaveTask < ActiveRecord::Base 
	@@fave_tasks = ["Example: Do laundry", "Example: Do long workout"]

	# def initialize # forgot reason here
	# end

	def self.fave_tasks
		@@fave_tasks
	end

	def self.add_to_fave_tasks(fave_task)
		if fave_task.downcase == "be mean to myself"
			return false
		else
			@@fave_tasks.push(fave_task)
		end
	end

end