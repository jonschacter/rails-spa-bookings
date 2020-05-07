class Spa < ApplicationRecord
    has_many :technicians, :dependent => :delete_all
    has_many :treatments
    has_many :appointments, :through => :treatments
    accepts_nested_attributes_for :technicians

    def technicians_attributes=(attributes)
        self.technicians.delete_all
        attributes.each do |i, technician_hash|
            if !technician_hash[:name].blank?
                self.technicians.build(technician_hash)
            end
        end
    end
end
