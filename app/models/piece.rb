class Piece < ActiveRecord::Base
	has_many :items

	validates :nom, presence: true
end
