class GaleriesController < ApplicationController
  def index
    @categories = Category.order('name ASC')
    @medias = Galery.order('created_at DESC').paginate(page: params[:page], per_page: 6)
    @pictures = Picture.order('created_at DESC').paginate(page: params[:page], per_page: 6)
  end

  def show_videos
  	@selected = Galery.order('created_at DESC').paginate(page: params[:page], per_page: 6)
  end

  def show_images
    @selected = Picture.order('created_at DESC').paginate(page: params[:page], per_page: 6)
  end

  def show_both
    @selected = Galery.order('created_at DESC').paginate(page: params[:page], per_page: 6)
    @pictures = Picture.order('created_at DESC').paginate(page: params[:page], per_page: 6)
  end

  def show_categories
    @selected = Galery.joins(:photosvideo).where("photosvideos.category_id = ?", params[:id]).paginate(page: params[:page], per_page: 6)
   #@selected = Category.find(params[:id]).photosvideos.order('created_at DESC')
   @pictures = Picture.joins(:photosvideo).where("photosvideos.category_id = ?", params[:id]).paginate(page: params[:page], per_page: 6)
   @active = params[:id];
   @categories = Category.order('name ASC')
  end

  def show_categories_all
    @selected = Galery.order('created_at DESC').paginate(page: params[:page], per_page: 6)
    @pictures = Picture.order('created_at DESC').paginate(page: params[:page], per_page: 6)
  end

end