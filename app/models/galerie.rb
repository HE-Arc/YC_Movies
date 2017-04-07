class Galerie < ApplicationRecord
	has_many :photosvideos, as: :imageable
 attr_accessor :mylink #attribut virtuel

	def media
		"https://www.youtube.com/embed/#{self.uid}"
	end

	def media2
		"https://img.youtube.com/vi/#{self.uid}/mqdefault.jpg"
	end

	def media3
		self.uid
	end
	#Model repris depuis https://www.sitepoint.com/youtube-rails/. Une modification du regex à du être adapté pour que cela fonctionne.
	#Ajout d'un attribut virtuel car c'est inutile de sauver le uid et le link comme le sugère le site.
  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*\z/i

    before_create :before_add_to_galerie
    after_create :after_add_to_galerie
    before_destroy :before_delete_to_galerie

  private
  def before_delete_to_galerie
    self.photosvideos.destroy_all
  end

  def after_add_to_galerie
  	self.photosvideos.create!
  end

    def before_add_to_galerie
    uid = @mylink.match(YT_LINK_FORMAT)

    self.uid = uid[2] if uid && uid[2]

    if self.uid.to_s.length != 11
      self.errors.add(:mylink, 'is invalid.')
      throw :abort
      false
    elsif Galerie.where(uid: self.uid).any?
      self.errors.add(:mylink, 'is not unique.')
      #3heures pour avoir découvert qu'il fallait rajouter ce truc ! http://stackoverflow.com/questions/23837573/rails-4-how-to-cancel-save-on-a-before-save-callback
      #ces commentaires sont inutiles, je les supprimes pour le prochain commit 
      throw :abort
      false
    end
end

validates :mylink, presence: true, format: YT_LINK_FORMAT
end