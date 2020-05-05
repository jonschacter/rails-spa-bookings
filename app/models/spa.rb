class Spa < ApplicationRecord
    has_many :technicians
    has_many :treatments
    has_many :appointments, :through => :treatments
end
