class WelcomeController < ApplicationController
  def index
  	@carrousels = Carrousel.order('created_at ASC')
  end
end
