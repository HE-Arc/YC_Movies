class GalerieController < ApplicationController
  def index
    @medias_count = Media.count
    @medias = Media.all
  end
end
