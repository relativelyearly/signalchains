module AdsHelper
  def ad
    return @ad if @ad
    @ad = Ad.find(:first, :order => 'RAND()')
    link_to(image_tag(@ad.image.url(:display)), @ad.url) if @ad
  end
end