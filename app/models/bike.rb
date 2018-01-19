class Bike < ApplicationRecord
  belongs_to :supplier#, optional: true
  has_many :rents
end
