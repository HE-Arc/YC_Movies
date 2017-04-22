class GaleriesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.js 
    end
    @categories = Category.order('name ASC')
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
  if @category == "All" || @category.blank?
    model.order('created_at DESC')
  else
     model.joins(:photosvideo).where("photosvideos.category_id = ?", @category)
  end
end