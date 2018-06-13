class Point < ApplicationRecord
  validates :title, presence: true
  validates :lat, presence: true
  validates :lon, presence: true
end
