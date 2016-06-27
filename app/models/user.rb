class User < ActiveRecord::Base
	has_many :stacks
	has_many :chronicles
  has_many :chronicle_bookmarks
	has_many :stack_bookmarks
	has_many :lists
  has_many :stack_contributors
  # has_many :stacks, through: :stack_contributors
  
  # allows users to upload image
  mount_uploader :avatar, PictureUploader

	# downcases email
	before_save { self.email = email.downcase }

	# first name and last name validation
  validates :fname,  presence: true, length: { maximum: 50 }, on: :create
  validates :lname,  presence: true, length: { maximum: 50 }, on: :create

  # username validation
  validates :lname,  presence: true, uniqueness:true, case_sensitive:false, on: :create

  # email validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, case_sensitive: false, on: :create

  # password validation
  has_secure_password
  validates :password, presence: true, on: :create
  validates_confirmation_of :password, presence: true, on: :create
end
