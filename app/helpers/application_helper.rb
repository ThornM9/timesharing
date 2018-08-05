module ApplicationHelper
  def friend_with?(other_user)
    friendships.find_by(friend_id: other_user.id)
  end
end
