class StackBookmark < ActiveRecord::Base
	belongs_to :user
	belongs_to :stack
end
