class FriendsFacade
  def self.add_friend(user, friend)
    Friendship.create(user_id: user.id, friend_id: friend.id)
  end
end
