module PostsHelper
	def course_names
		["CISC","BIOL","PSYC", "ANAT","ANCH","AODA","APSC","ARAB","ARTC","ARTF","ARTH","BCHM","BIOL","BIOM","BIOT","BISC","BMED","CDNS","CHEE","CHEM","CHIN","CISC","CIVL","CLAS","CMC","CMPE","COCA","COGS","COMM","COMP","CWRI","DEVS","DRAM","ECON","EDST","EDUC","ELEC","ENGL","FILM","FREN","GEOL","GPHY","GREK","GRMN","HIST","HLTH","LAW","LING","LISC","MATH","MBIO","MUSC","NURS","PHAR","PHIL","PHYS","SPAN","WRTI"]
	end		

	def course_numbers
		(100..500).to_a
	end

	def gender
		['MALE','FEMALE']
	end

	def department
		["Arts and Science","Education","Engineering & Applied Science","Health Science","Law","Business"]
	end

	def show_image(user)

		if user.avatar?
  			user.avatar.url(:medium)

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

