class ChronicleCategory < ActiveRecord::Base
	belongs_to :chronicle
	belongs_to :category
end
