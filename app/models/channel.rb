class Channel < ApplicationRecord
  has_many :users, through: :discussions
  has_many :discussions
  validates :channel, presence: true, uniqueness: true
end
