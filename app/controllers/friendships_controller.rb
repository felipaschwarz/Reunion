class FriendshipsController < ApplicationController
	
	def index
		@users = User.where.not(id: current_user.id ) # User.where( current_user.friendships.friend == nil )
		@friendrequests = current_user.friendships.where(status: 'pending')
		@friends = current_user.friendships.where(status: 'accepted')
	end

	def create
		@friendship = current_user.friendships.new(friend_id: params[:friend_id], status: 'requested')
		respond_to do |format|
			if @friendship.save 
				format.html { redirect_to user_friendships_path, notice: 'Friendrequest sent.' }
			else
				format.html { render :index, alert: 'Unable to send friendrequest.' }
			end
		end
	end

	def update
		@friendship = current_user.friendships.find(params[:id])
		@friendship.update(status: 'accepted')
		respond_to do |format|
			if @friendship.save
				format.html { redirect_to user_friendships_path, notice: 'Friend accepted.' }
			else
				format.html { render :index, alert: 'Unable to accept friend.' }
			end
		end
	end

	def destroy
		@friendship = current_user.friendships.find(params[:id])
		if @friendship.destroy
				format.html { redirect_to user_friendships_path(params[:user_id]), notice: 'Friendship deleted.' }
			else
				format.html { render :index, alert: 'Unable to delete friendship.' }
			end
	end

end
