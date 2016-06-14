class Chronicle < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :stacks
	has_many :bookmarks
end
