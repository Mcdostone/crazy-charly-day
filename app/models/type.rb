class Type < ActiveRecord::Base
	has_many :items

	# Rules
	validates :materiau, presence: true
end
