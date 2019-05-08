class User < ApplicationRecord
  has_secure_password
  validates :email, :username, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :name, :street_1,  :city,  :postal_code,  presence: true
  # validates_format_of :zip, :with => /^d{5}(-d{4})?$/, :message => "should be in the form 12345 or 12345-1234"
  has_many :discussions, dependent: :destroy
  has_many :channels, through: :discussions
end

