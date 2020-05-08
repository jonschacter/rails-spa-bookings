class Technician < ApplicationRecord
  belongs_to :spa
  has_many :treatments
  has_many :users, :through => :treatments

  validates :name, :presence => true

end
