class UsersController < ApplicationController
	before_action :authenticate_user!

	def profile
		@user = current_user
		render 'users/profile'
	end
end
	# def index
	# 	@users = User.all
	# end

	# def show
	# 	@user = User.find(params[:id])
	# end

	# def new
	# 	@user = User.new
	# end

	# def edit
	# 	@user = User.find(params[:id])
	# end

	# def create
	# 	@user = User.new(user_params)

	# 	respond_to do |format|
	# 		if @user.save
	# 			format.html { redirect_to @user,
	# 			notice: 'User was successfully created.' }
	# 		else
	# 			format.html { render :new }
	# 		end
	# 	end
	# end

	# def update
	# 	@user = User.find(params[:id])
	# 	respond_to do |format|
	# 		if @user.update(user_params)
	# 			format.html { redirect_to @user, notice: 'User was successfully updated.' }
	# 		else
	# 			format.html { render :edit }
	# 		end
	# 	end
	# end


	# def destroy
	# 	@user = User.find(params[:id])
	# 	@user.destroy
	# 	respond_to do |format|
	# 		format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
	# 	end
	# end

	# private

	# def user_params
	# 	params.require(:user).permit(
	# 			:username,
	# 			:firstname,
	# 			:lastname,
	# 			:email,
	# 			:password,
	# 			:address_1,
	# 			:address_2,
	# 			:city,
	# 			:state,
	# 			:country)
	# end
