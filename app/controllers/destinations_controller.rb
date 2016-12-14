class DestinationsController < ApplicationController

	def index
		@destinations = Destination.all
	end

	def show
		@destination = Destination.find(params[:id])
	end

	def new
		@user = User.find(params[:user_id])
		@destination = @user.destinations.new
	end

	def edit
		@destination = Destination.find(params[:id])
	end

	def create
		@user = User.find(params[:user_id])
		@destination = @user.destinations.new(destination_params) 

		respond_to do |format|
			if @destination.save 
				format.html { redirect_to profile_path, notice: 'Destination was successfully created.' }
			else
				format.html { render :new }
			end
		end
	end

	def update
		@destination = Destination.find(params[:id])
		respond_to do |format|
			if @destination.update(task_params)
				format.html { redirect_to @destination, notice: 'Destination was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@destination = Destination.find(params[:id])
		@destination.destroy
		
		respond_to do |format|
			format.html { redirect_to tasks_url, notice: 'Destination was successfully destroyed.' }
		end
	end

	def request_trips
		friendships = current_user.friendships.where(status: 'accepted')
		friends = friendships.map {|fs| fs.friend }
		destinations = friends.map do |f|
			f.destinations.where("departure_on >= ?", params[:from_date]).where("arrival_on <= ?", params[:to_date])
		end #.flatten
		binding.pry

		render json: destinations, status: 200
	end




  private

    def destination_params
      params.require(:destination).permit(:arrival_on, :departure_on, :place, :lat, :lng)
    end
end
