class User < ApplicationRecord
	has_many :destinations
	has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships #, dependent: :destroy

	#:confirmable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
	
	validates_presence_of :username, :firstname, :lastname, on: :create

	validates :username, length: { maximum: 50 }, uniqueness: true
	validates :password, length: { minimum: 8 }

end
