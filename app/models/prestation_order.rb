class PrestationOrder < ApplicationRecord
	attr_writer :current_step

	validates_presence_of :name, :if => lambda { |o| o.current_step == 2 }
	validates_presence_of :firstname, :if => lambda { |o| o.current_step == 2 }

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

	def typesofproduct
		%w[Passion Fête Commercial Mariage Artistique]
	end

end
