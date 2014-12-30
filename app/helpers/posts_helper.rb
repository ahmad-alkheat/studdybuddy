module PostsHelper
	def course_names
		["CISC","BIOL","PSYC"]
	end		

	def course_numbers
		[121,221,232,343,231,432]
	end


	def show_image(user)
  		if user.image_string.nil?
    		"missing.png"
  		else
   			 user.image_string
  		end
	end


	
end
