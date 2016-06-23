class Stack < ActiveRecord::Base
	belongs_to :user
	has_many :follows
	has_many :stack_categories
	has_many :stack_bookmarks
	has_many :categories, through: :stack_categories
	has_many :stack_chronicles
	has_many :chronicles, through: :stack_chronicles
	has_many :stack_contributors
	has_many :users, through: :stack_contributors
end
