class GalerieController < ApplicationController
  def index
    @medias = Media.all.paginate(page: params[:page], per_page: 6)
    @medias_count = @medias.count
  end
end
