class User < ActiveRecord::Base
	has_many :stacks
	has_many :chronicles
	has_many :bookmarks
	has_many :lists

	# downcases email
	before_save { self.email = email.downcase }

	# first name and last name validation
  validates :fname,  presence: true, length: { maximum: 50 }, on: :create
  validates :lname,  presence: true, length: { maximum: 50 }, on: :create

  # email validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, case_sensitive: false, on: :create

  # password validation
  has_secure_password
  validates :password, presence: true, on: :create
  validates_confirmation_of :password, presence: true, on: :create
end
