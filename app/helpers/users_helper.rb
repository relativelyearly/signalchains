module UsersHelper
  def follow_button(user)
    if current_user.nil? || current_user == user
      nil
    elsif current_user.follows?(user)
      link_to '<span>unfollow</span>', follow_user_url(@user), :class => 'btn w10'
    else
      link_to '<span>follow</span>', follow_user_url(@user), :class => 'btn w10'
    end
  end
end