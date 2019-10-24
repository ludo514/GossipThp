class Tag < ApplicationRecord
	has_many :tagGossips
	has_many :Gossips, through: :tagGossip
end
