class BarnyardController < ApplicationController

	def animals

		@barnyard = []

		animal = Animal.new
		animal.name = "cow";
		animal.noise = "moo!";

		@barnyard << animal


		animal = Animal.new
		animal.name = "dog";
		animal.noise = "woof!";

		@barnyard << animal
	end
end
