class Technician < ApplicationRecord
  belongs_to :spa
  has_many :treatments
  has_many :users, :through => :treatments
end
