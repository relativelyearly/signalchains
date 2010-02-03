Factory.define :blog_post do |blog_post|
  blog_post.title "Title"
  blog_post.content "Content"
  blog_post.author {|author| author.association(:user)}
end
