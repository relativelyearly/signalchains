require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase
  context "A BlogPost instance" do
    setup do
      @blog_post = Factory(:blog_post)
    end

    subject { @blog_post }

    should_belong_to :author
    should_have_many :comments, :dependent => :destroy
  end
end
