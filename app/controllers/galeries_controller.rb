class GaleriesController < ApplicationController
  def index
    @categories = Category.order('name ASC')
    @medias = Galery.order('created_at DESC')
    @pictures = Picture.order('created_at DESC')

  end

  def show_videos
    #@selected = Photosvideo.where(imageable_type: "Galerie").order('created_at DESC')
  	@selected = Galery.order('created_at DESC')
  end

   def show_images
    @selected = Picture.order('created_at DESC')
    #@selected = Photosvideo.where(imageable_type: "Picture").order('created_at DESC')
  	#@selected = Picture.order('created_at DESC')
  end


   def show_both
    @selected = Galery.order('created_at DESC')
    @pictures = Picture.order('created_at DESC')
  end

  def show_categories
    #select toutes les photosvideo qui font partie de la categorie qui contient l'id params[:id]
   #@selected = Photosvideo.where(category_id: params[:id]).order('created_at DESC')
   @selected = Category.find(params[:id]).photosvideos.order('created_at DESC')

   @active = params[:id];

   @categories = Category.order('name ASC')
  # Photosvideo.includes(:imageable).where('imageable.category.id'== params[:id])
  end


  def new
    @galerie = Galerie.new
  end

def create
  @galerie = Galerie.new(galerie_params)
  else
    render :new
  end
end

  def edit
    @galerie = Galerie.find(params[:id])
  end


private

def galerie_params
  params.require(:galerie).permit(:mylink)
end