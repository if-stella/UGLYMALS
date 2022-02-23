class Animal < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :age, :species, presence: true
  validates :age, numericality: { only_integer: true }
  validates :name, length: { minimum: 3 }
  has_one_attached :photo
end
