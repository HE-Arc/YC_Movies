class GaleriesController < ApplicationController
  def index
    @categories = Category.order('name ASC')
    @medias = Galery.order('created_at DESC')
    @pictures = Picture.order('created_at DESC')
  end


def show_media
  @category = params[:category]
  @type     = params[:type]

  @pictures = media(Picture) if @type == "pictures"
  @videos   = media(Galery) if @type == "videos"

  @category = "All" if @category.blank?
  @type = "both" if @type.blank?
  if  @type == "both"
    @pictures = media(Picture)
    @videos   = media(Galery) 
  end
end

end

private
def media(model)
  if @category.blank?
    model.order('created_at DESC')
  else
     model.joins(:photosvideo).where("photosvideos.category_id = ?", @category)
  end
end