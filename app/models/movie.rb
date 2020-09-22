class Movie < ApplicationRecord
	has_many :appearances
	has_many :actors, through: :appearances
	validates :title, :duration, :rating, :release_date, presence: true
end
