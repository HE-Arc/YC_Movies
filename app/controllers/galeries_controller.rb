class GaleriesController < ApplicationController
  def index
    @galeries = Galerie.order('created_at DESC')
    @pictures = Picture.order('created_at DESC')
    @uid = ""

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