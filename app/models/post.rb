class Post < ActiveRecord::Base
	searchkick

  ALLOWED_NUM = (100..500).to_a
  ALLOWED = ["CISC","BIOL","PSYC", "ANAT","ANCH","AODA","APSC","ARAB","ARTC","ARTF","ARTH","BCHM","BIOL","BIOM","BIOT","BISC","BMED","CDNS","CHEE","CHEM","CHIN","CISC","CIVL","CLAS","CMC","CMPE","COCA","COGS","COMM","COMP","CWRI","DEVS","DRAM","ECON","EDST","EDUC","ELEC","ENGL","FILM","FREN","GEOL","GPHY","GREK","GRMN","HIST","HLTH","LAW","LING","LISC","MATH","MBIO","MUSC","NURS","PHAR","PHIL","PHYS","SPAN","WRTI"]
  validates_inclusion_of :course_name, in: ALLOWED
  validates_inclusion_of :course_number, in: ALLOWED_NUM

	belongs_to :user
	delegate :id, :name, :email, :image_string, :avatar, :to => :user, :prefix => true
	
end
