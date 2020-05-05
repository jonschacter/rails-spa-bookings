class Appointment < ApplicationRecord
  belongs_to :treatment
  belongs_to :technician
  belongs_to :user
end
