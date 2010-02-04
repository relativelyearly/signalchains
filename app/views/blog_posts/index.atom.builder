atom_feed(:schema_date => "2008-04-22") do |feed|
  feed.title("The Sounding Board")
  feed.updated((@blog_posts.first.created_at))

  for post in @blog_posts
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(textilize(post.content), :type => 'html')

      entry.author do |author|
        author.name(post.author.display_name)
      end
    end
  end
end

