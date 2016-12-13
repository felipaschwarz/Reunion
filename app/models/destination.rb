class Destination < ApplicationRecord
	belongs_to :user

	validate :validate_arrival_and_departure, on: [:create, :update] 
	validates_presence_of [:arrival_on, :departure_on, :place], on: [:create, :update]
	validate :validate_from_and_to, on: :map
	validates_presence_of [:from_date, :to_date], on: :map

	def validate_arrival_and_departure
  	if arrival_on > departure_on
  		errors.add('Arrival on can´t be later than departure.')
  	end
  end

  def validate_from_and_to
  	if from_date > to_date
  		errors.add('First date can´t be later than second date.')
  	end
  end
end
