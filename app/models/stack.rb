class Stack < ActiveRecord::Base
	belongs_to :user
	has_many :chronicles
	has_many :follows
	has_many :stack_categories
	has_many :categories, through: :stack_categories
end
