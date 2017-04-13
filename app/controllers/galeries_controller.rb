class GaleriesController < ApplicationController
  def index
    @categories = Category.order('name ASC')
    @medias = Photosvideo.order('created_at DESC')
  end

  def show_videos
    @selected = Photosvideo.where(imageable_type: "Galerie").order('created_at DESC')
  	#@selected = Galerie.order('created_at DESC')
  end

   def show_images
    @selected = Photosvideo.where(imageable_type: "Picture").order('created_at DESC')
  	#@selected = Picture.order('created_at DESC')
  end

   def show_both
    #la pagination devra encore être ajouter ici
    @selected = Photosvideo.order('created_at DESC')
  end

  def show_categories
    #select toutes les photosvideo qui font partie de la categorie qui contient l'id params[:id]
   # @temp = Photosvideo.find(params[:id]).imageable.category.id #USELESS
   @selected = Photosvideo.where(category_id: params[:id]).order('created_at DESC')
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