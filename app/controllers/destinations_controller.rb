class DestinationsController < ApplicationController
	
	def index
		@destinations = Destination.all
	end

	def show
		@destination = Destination.find(params[:id])
	end

	def new
		@destination = Destination.new
	end

	def edit
		@destination = Destination.find(params[:id])
	end

	def create
		@destination = Destination.new(destination_params)

		respond_to do |format|
			if @destination.save
				format.html { redirect_to @destination, notice: 'Destination was successfully created.' }
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

  private

    def destination_params
      params.require(:destination).permit( :arrival_on, :departure_on, :address_1, :address_2, :city, :state, :country)
    end
end
