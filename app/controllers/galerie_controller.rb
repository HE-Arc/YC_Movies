class GalerieController < ApplicationController
  def index
    @medias = Media.all
    @medias_count = @medias.count
  end

  def passion

  end
end
