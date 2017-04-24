class GaleriesController < ApplicationController
  def index
  @categories = Category.order('name ASC')
  @category = params[:category]
  @type     = params[:type]


  # XXX Ceci est en doublon plus bas, il n'y aurait pas plus simple?
  @pictures = media(Picture).page(params[:picture_page]).per(6) if @type == "pictures"
  @videos   = media(Video).page(params[:video_page]).per(6) if @type == "videos"

  @category = "All" if @category.blank?
  @type = "both" if @type.blank?
  if  @type == "both"
    @pictures = media(Picture).page(params[:picture_page]).per(6)
    @videos   = media(Video).page(params[:video_page]).per(6)
  end
end


end

private
def media(model)
  if @category == "All" || @category.blank?
    model.order('created_at DESC')
  else
     model.joins(:photosvideo).where("photosvideos.category_id = ?", @category).order('created_at DESC')
  end
end
