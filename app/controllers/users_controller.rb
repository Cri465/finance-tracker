class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def search
    @test = User.none
    hello = params[:terms].split(" ")
    hello.each do |param|
      @test += User.search(param)
    end
    @test.uniq!
    respond_to do |format|
      format.js { render partial: "users/friends-result" }
    end
  end

  def my_friends
    @friends = current_user.friends
  end
end
