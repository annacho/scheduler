class CreateNewFaveTasks < ActiveRecord::Migration
  def change
  	  	drop_table :fave_tasks

  	 	create_table :fave_tasks do |t|
	  	t.string :description
	    t.date :date
	    t.time :time
	    t.timestamps
	end
  end
end
