class Item < ActiveRecord::Base
	belongs_to :piece
	belongs_to :type

	has_many :commentaires
	
	# To upload images
	mount_uploader :photo, PhotoUploader

	# Rules to create a valid Item
	validates :nom, presence: true
	validates :piece_id, presence: true
	validates :type_id, presence: true

	validates :nom, length: {		
		minimum: 2, 
		maximum: 255,
		too_long: "%{count} caractères sont autorisés, Ne polluez pas la BD !",
		too_short: "Le nom du produit doit contenir au moins %{count} caractères"
	}
	validates :prix, presence: true

	validates_numericality_of :prix, :greater_than => 0, :message => "Le prix ne peut pas être négatif"
	validates_numericality_of :likes, :greater_than_or_equal_to => 0



	before_save :set_defaults

	private
	def set_defaults
		self.likes = 0
	end
end
