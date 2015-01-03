module PostsHelper
	def course_names
		["CISC","BIOL","PSYC"]
	end		

	def course_numbers
		[121,221,232,343,231,432]
	end

	def gender
		['MALE','FEMALE']
	end

	def department
		["Arts and Science","Education","Engineering & Applied Science","Health Science","Law","Business"]
	end

	def show_image(user)

		if user.avatar?
  			user.avatar.url(:thumb)

  		else if user.image_string?
  			user.image_string
  			
  		else if user.gender == "MALE"
  			"missing.png"

  		else
  			"missingf.png"
  		end
	end
end
end
end

