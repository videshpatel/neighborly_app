class Discussion < ApplicationRecord
  has_many :replies, dependent: :destroy
  belongs_to :channel
  belongs_to :user
  validates :title, :content, :channel, presence: true
end
