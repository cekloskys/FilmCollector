class Actor < ApplicationRecord
	has_many :appearances
	has_many :movies, through: :appearances
	validates :first_name, :last_name, presence: true
end
