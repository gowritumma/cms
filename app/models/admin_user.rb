class AdminUser < ApplicationRecord
	has_secure_password
	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :section, :through => :section_edits
	scope :sorted, lambda {order("lastname ASC, firstname ASC")}
	validates :firstname, :presence => true,
												 :length => { :maximum => 25 }
  	validates :lastname, :presence => true,
                        :length => { :maximum => 50 }
  	validates :username, :length => { :within => 8..25 },
                       :uniqueness => true
                       validates :email, :presence => true,
                    :length => { :maximum => 100 }
	def name
		"#{firstname}  #{lastname}"
	end

end
