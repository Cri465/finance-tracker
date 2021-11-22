class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def search
    @results = User.none

    if !params[:terms].empty?
      user_input = params[:terms].split(" ")
      user_input.each do |param|
        @results += User.search(param)
      end

      @results.uniq!
      @results = results = current_user.except_current_user(@results)
      if !@results.empty?
        respond_to do |format|
          format.js { render partial: "users/friends-result" }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Couldn't find user"
          format.js { render partial: "users/friends-result" }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a friend name or email to search"
        format.js { render partial: "users/friends-result" }
      end
    end
  end

  def my_friends
    @friends = current_user.friends
  end
end
