class AddLongitudeToDoctor < ActiveRecord::Migration
  def change
  	add_column :doctors, :longitude, :float

  end
end
