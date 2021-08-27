class FriendshipsController < ApplicationController

  def create
    friend = User.find_by(email: params[:search])

    if friend.present? && friend.email == current_user.email
      flash[:error] = "You can't add yourself as a friend."
    elsif friend.present? && current_user.friends.include?(friend)
      flash[:error] = "That friend is already...a friend."
    elsif friend.present? && friend.email != current_user.email
      new_friend = Friendship.create(user_id: current_user.id, friend_id: friend.id)
      flash[:success] = "Successfully added #{friend.username}"
    else
      flash[:error] = "I'm sorry your friend cannot be found."
    end
    redirect_to dashboard_path
  end
end
