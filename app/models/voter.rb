class Voter < ActiveRecord::Base
	validates :name, presence: true
	validates :party, presence: true, uniqueness: true
end
