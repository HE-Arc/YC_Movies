class PrestationOrder < ApplicationRecord
	attr_writer :current_step

	def current_step
		@current_step || 1
	end

	def next_step
		self.current_step += 1
	end

	def previous_step
		self.current_step -= 1
	end

	def first_step?
		current_step == 1
	end

	def second_step?
		current_step == 2
	end

	def third_step?
		current_step == 3
	end

	def self.typesofproduct
		%w[Passion Fête Commercial Mariage Artistique]
	end

	validates :name, presence: true, length: { maximum: 50 }, :if => lambda { |o| o.current_step == 2 }
	validates :firstname, presence: true, length: { maximum: 50 }, :if => lambda { |o| o.current_step == 2 }
	validates :entreprise, length: { maximum: 50 } , allow_blank: true, :if => lambda { |o| o.current_step == 2 }
	validates :email, presence: true, length: { maximum: 254 }, :if => lambda { |o| o.current_step == 2 }
	validates :tel, presence: true, length: { maximum: 20 }, numericality: { only_integer: true }, :if => lambda { |o| o.current_step == 2 }
	validates :place, presence: true, length: { maximum: 500 }, :if => lambda { |o| o.current_step == 2 }
	validates :availabilities, presence: true, length: { maximum: 500 }, :if => lambda { |o| o.current_step == 2 }
	validates :typeofproduct, presence: true, inclusion: { in: self.typesofproduct }, :if => lambda { |o| o.current_step == 2 }
	validates :product, presence: true, length: { maximum: 500 }, :if => lambda { |o| o.current_step == 2 }
	validates :length, presence: true, :if => lambda { |o| o.current_step == 2 }
	validates :interview, presence: true, :if => lambda { |o| o.current_step == 2 }
	validates :day, numericality: { only_integer: true }, allow_blank: true, :if => lambda { |o| o.current_step == 2 }
	validates :month, presence: true, :if => lambda { |o| o.current_step == 2 }
	validates :other, length: { maximum: 500 }, allow_blank: true, :if => lambda { |o| o.current_step == 2 }


end
