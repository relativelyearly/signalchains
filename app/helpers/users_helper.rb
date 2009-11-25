module UsersHelper
  def follow_button(user)
    if current_user.nil? || current_user == user
      nil
    elsif current_user.follows?(user)
      link_to 'unfollow', follow_user_url(@user), :class => 'button'
    else
      link_to 'follow', follow_user_url(@user), :class => 'button'
    end
  end
end