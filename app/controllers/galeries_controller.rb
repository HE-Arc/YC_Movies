class GaleriesController < ApplicationController
  def index
#https://github.com/rails/rails/issues/939 car @medias à la place de a ne fonctionne pas
#a = Galerie.select(:uid,:created_at).union(Picture.select(:image_file_name, :created_at))
#sql = a.to_sql
#@test = Galerie.find_by_sql(sql)
#@test.each do |galerie|
#	p galerie.class.name
#end
#@medias = Galerie.find_by_sql('select uid, created_at from galeries UNION select image_file_name , created_at from pictures order by created_at')

@test = Photosvideo.where(imageable_type: "Galerie")
@test.each do |lol|
	p lol.created_at
	if lol.imageable_type == "Galerie"
		p lol.imageable.uid
    p "LOOOOOOOOOOOOOLLLLSLLS"
	end
	if lol.imageable_type == "Picture"
		p lol.imageable.image_file_name
    p "LOOOOOOOOOOOOOOOOOOOOOOL"
	end
end

#ENFIN ! :D

@medias = (Galerie.order('created_at DESC') + Picture.order('created_at DESC')).sort_by { |model| model.created_at }
  end

  def show_videos
  	@selected = Galerie.order('created_at DESC')
  end

   def show_images
  	@selected = Picture.order('created_at DESC')
  end

   def show_both
  	@selected = (Galerie.order('created_at DESC') + Picture.order('created_at DESC')).sort_by { |model| model.created_at }
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


private

def galerie_params
  params.require(:galerie).permit(:mylink)
end