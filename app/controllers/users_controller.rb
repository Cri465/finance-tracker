class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end
	def search

		if params[:terms].present?
			@user = User.new(User.where(email: params[:terms])).first
			byebug
			if params[:terms].include?("@")
				
			else

			end
		end
	end
	def my_friends
		@friends = current_user.friends
	end

end
