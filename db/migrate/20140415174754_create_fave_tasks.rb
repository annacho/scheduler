class CreateFaveTasks < ActiveRecord::Migration
  def change
  	create_table :fave_tasks do |t|
  		t.string :description 
  		t.date :date
  		t.time :time # may need to distinguish AM or PM
  		t.timestamps
  	end
  end
end
