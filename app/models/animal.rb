class Animal < ApplicationRecord
  belongs_to :user
  # validates :name, :age, :species, presence: true
  # validates :age, numericality: { only_integer: true }
  # validates :name, length: { minimum: 3 }
end
