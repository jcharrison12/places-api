class Place < ApplicationRecord
  validates :name, presence: true
  validates :address, uniqueness: true
end
