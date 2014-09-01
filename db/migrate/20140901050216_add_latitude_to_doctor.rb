class AddLatitudeToDoctor < ActiveRecord::Migration
  def change
  	 add_column :doctors, :latitude, :float
  end
end
