class Admin::BlogPostsController < ResourceController::Base
  before_filter :require_admin

  create.before do
    object.author = current_user
  end
  
  index.wants.html { render :file => 'blog_posts/index', :layout => 'application' }
  create.wants.html { redirect_to blog_post_path(object) }
  update.wants.html { redirect_to blog_post_path(object) }
end