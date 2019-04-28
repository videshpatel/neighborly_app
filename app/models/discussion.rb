class Discussion < ApplicationRecord
  has_many :replies, dependent: :destroy
  belongs_to :channel
  belongs_to :user
  validates :title, presence: true, uniqueness: true
end
