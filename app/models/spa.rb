class Spa < ApplicationRecord
    has_many :technicians
    has_many :treatments
    has_many :appointments, :through => :treatments
    accepts_nested_attributes_for :technicians, reject_if: proc { |attributes| attributes['name'].blank? }
end
