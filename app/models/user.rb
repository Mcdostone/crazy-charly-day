require 'bcrypt'

class User < ActiveRecord::Base

	include BCrypt

	before_save :encrypt_password
	after_save :clean_password

	validates :email, :presence => true, :uniqueness => true
	validates :password, :confirmation => true #password_confirmation attr
	validates_length_of :password, :in => 6..20, :on => :create 

	def encrypt_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.password = BCrypt::Engine.hash_secret(password, salt)
		end
	end

	def clean_password
		self.password = nil
	end


	def self.authenticate(email, password)
  		user = find_by_email email
  		if (user && (user.password == BCrypt::Engine.hash_secret(password, user.salt)))
    		user
  		else
    		nil
  		end
  	end
	
end