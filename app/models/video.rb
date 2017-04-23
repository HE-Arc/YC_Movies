class Video < ApplicationRecord
  belongs_to :photosvideo
  validate :validate_url
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
  def validate_url
    uid = self.uid.match(YT_LINK_FORMAT)
    self.uid = uid[2] if uid && uid[2]
    if self.uid.to_s.length != 11
      self.errors.add(:uid, 'is invalid.')
      false
    end
  end
end