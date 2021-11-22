class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: params[:friend])
    if current_user.save
      flash[:notice] = "Following user"
    else
      flash[:alert] = "something wrong"
    end
    redirect_to friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to friends_path
  end
end
