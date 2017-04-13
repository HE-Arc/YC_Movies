class Galerie < ApplicationRecord
	has_many :photosvideos, as: :imageable
  belongs_to :category
 attr_accessor :mylink #attribut virtuel

	def media
		"https://www.youtube.com/embed/#{self.uid}"
	end

	def media2
		"https://img.youtube.com/vi/#{self.uid}/hqdefault.jpg"
	end

	def media3
		self.uid
	end
	#Model repris depuis https://www.sitepoint.com/youtube-rails/. Une modification du regex à du être adapté pour que cela fonctionne.
	#Ajout d'un attribut virtuel car c'est inutile de sauver le uid et le link comme le sugère le site.
  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*\z/i

    before_create :before_add_to_galerie
    before_update :before_add_to_galerie, :update_photosvideos
    after_create :after_add_to_galerie
    before_destroy :before_delete_to_galerie

  private
  def before_delete_to_galerie
    self.photosvideos.destroy_all
  end

  def update_photosvideos
    self.photosvideos.update_all(:category_id => self.category_id)
  end

  def after_add_to_galerie
  	self.photosvideos.create!(:category_id => self.category_id)
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
      throw :abort
      false
    end
end

validates :mylink, presence: true, format: YT_LINK_FORMAT
end