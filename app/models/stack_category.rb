class StackCategory < ActiveRecord::Base
	belongs_to :stack
	belongs_to :category 
end
