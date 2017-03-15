class PrestationOrder < ApplicationRecord
	attr_writer :current_step

	validates_presence_of :name, :if => lambda { |o| o.current_step == "choose_details" }
	validates_presence_of :firstname, :if => lambda { |o| o.current_step == "choose_details" }

	def current_step
		@current_step || steps.first
	end

	def steps
		%w[choose_theme choose_details see_and_confirm]
	end

	def next_step
		self.current_step = steps[steps.index(current_step)+1]
	end

	def previous_step
		self.current_step = steps[steps.index(current_step)-1]
	end

	def first_step?
		current_step == steps.first
	end

	def last_step?
		current_step == steps.last
	end

	def typesofproduct
		%w[Passion Fête Commercial Mariage Artistique]
	end

end
