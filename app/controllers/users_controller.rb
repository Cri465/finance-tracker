class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def search
    if params[:terms].present?
      @users = User.all
      @test
      if params[:terms].include?("@")
        @test = @users.where("email LIKE?", "%" + params[:terms] + "%")
      else
        @terms = params[:terms].split(" ")
        @test = Array.new
        @users.each do |user|
          @terms.each do |term|
            @test << user if user.first_name.include?(term)
            @test << user if user.last_name.include?(term)
          end
        end
        # @test = User.where("first_name LIKE?", "%"+ @terms[0] +"%").or(User.where("last_name LIKE?", "%"+@terms[1] +"%"))
      end
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
