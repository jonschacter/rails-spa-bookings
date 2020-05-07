class Spa < ApplicationRecord
    has_many :technicians, :dependent => :delete_all
    has_many :treatments
    has_many :appointments, :through => :treatments
end
