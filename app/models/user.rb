class User < ApplicationRecord
  # later add: :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :destinations
	validates_uniqueness_of :username, :email
	validates_presence_of :username, :firstname, :lastname, :city, :country, on: :create
end
