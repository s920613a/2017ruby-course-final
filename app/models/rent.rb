class Rent < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :bike, optional: true
end
