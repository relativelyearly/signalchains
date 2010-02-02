class Admin::BlogPostsController < ResourceController::Base
  before_filter :require_admin

  create.before do
    object.author = current_user
  end
  
  create.wants.html { redirect_to admin_blog_post_path(object) }
end