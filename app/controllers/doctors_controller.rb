class DoctorsController < ApplicationController

	def index
		@doctors = current_user.doctors
    @doctor = doctor.order_by_rand.first
	end

	def new
		@doctor = doctor.new
	end
	
	def create
		@doctor = current_user.doctors.new(doctor_params)
		if @doctor.save
			redirect_to doctors_path	
		else
      		render :action => 'new'
    	end
	end
	
	def show
		@doctors = current_user.doctors
		@hash = Gmaps4rails.build_markers(@doctors) do |doctor, marker|
      marker.lat doctor.latitude
      marker.lng doctor.longitude
      marker.title doctor.name
		end
	end
	
	def edit
		@doctor = doctor.find params[:id]
	end
	
	def update
		@doctor = doctor.find params[:id]
    	if @doctor.update_attributes(doctor_params)
       	   redirect_to doctors_path
    	else
      	render :action => :edit
   		end
	end
	
	def destroy
		@doctor = doctor.find params[:id]
    	@doctor.destroy
    	redirect_to doctors_path
  end


private

	def doctor_params
		params.require(:doctor).permit(:name, :location, :equipment, :hours, :open_space, :doctoring_lot, :restrooms, :comments, :user_id)
	end

end
