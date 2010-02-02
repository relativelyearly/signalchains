xml.instruct!

xml.urlset "xmlns" => "http://www.google.com/schemas/sitemap/0.84" do
  xml.url do
    xml.loc "http://#{request.host}/"
    xml.lastmod Time.now.to_s(:w3c)
    xml.changefreq "always"
  end

  @users.each do |user|
    xml.url do
      xml.loc user_by_login_url(user.login)
      xml.lastmod user.updated_at.to_s(:w3c)
      xml.changefreq "daily"
      xml.priority 0.5
    end
  end

  @chains.each do |chain|
    xml.url do
      xml.loc chain_url(chain)
      xml.lastmod chain.updated_at.to_s(:w3c)
      xml.changefreq "daily"
      xml.priority 0.6
    end
  end

  @mics.each do |mic|
    xml.url do
      xml.loc mic_url(mic)
      xml.lastmod mic.updated_at.to_s(:w3c)
      xml.changefreq "daily"
      xml.priority 0.8
    end
  end

  @preamps.each do |preamp|
    xml.url do
      xml.loc preamp_url(preamp)
      xml.lastmod preamp.updated_at.to_s(:w3c)
      xml.changefreq "daily"
      xml.priority 0.8
    end
  end

  @converters.each do |converter|
    xml.url do
      xml.loc converter_url(converter)
      xml.lastmod converter.updated_at.to_s(:w3c)
      xml.changefreq "daily"
      xml.priority 0.8
    end
  end

  @dynamics_processors.each do |dynamics_processor|
    xml.url do
      xml.loc dynamics_processor_url(dynamics_processor)
      xml.lastmod dynamics_processor.updated_at.to_s(:w3c)
      xml.changefreq "daily"
      xml.priority 0.8
    end
  end

  @effects_processors.each do |effects_processor|
    xml.url do
      xml.loc effects_processor_url(effects_processor)
      xml.lastmod effects_processor.updated_at.to_s(:w3c)
      xml.changefreq "daily"
      xml.priority 0.8
    end
  end

  @equalizers.each do |equalizer|
    xml.url do
      xml.loc equalizer_url(equalizer)
      xml.lastmod equalizer.updated_at.to_s(:w3c)
      xml.changefreq "daily"
      xml.priority 0.8
    end
  end
end