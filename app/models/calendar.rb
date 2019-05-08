class Calendar < ApplicationRecord
  validates :date, :title, :desc, presence: true
end
