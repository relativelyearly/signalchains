class BlogPostsController < ResourceController::Base
  actions :index, :show

  index.wants.atom
end
