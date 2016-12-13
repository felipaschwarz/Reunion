class UsersController < ApplicationController
	
	def profile
		@user = current_user
		render 'users/profile'
	end

	def search_user
		user_result = User.find_by_username(params["search"])
		if user_result
			friendship_result = user_result.friendships.find_by(friend_id: current_user.id)
		end
		search_result =  {user_result: user_result, friendship_result: friendship_result}
		render(json: search_result, status: :ok)
	end

	def update_home
		
	end
end