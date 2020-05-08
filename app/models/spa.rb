class Spa < ApplicationRecord
    has_many :technicians, :dependent => :delete_all
    has_many :treatments
    has_many :appointments, :through => :treatments
    validates :name, :presence => true
    scope :by_zipcode, -> (zipcode) { where("zip = ?", zipcode)}

    def available_timeslots
        available_times = []
        half_hours_array = datetime_array_for_each_working_half_hour
        half_hours_array.each_with_index do |half_hours, index|
            if self.appointments.find_by(appointment_time: half_hours)
            elsif appointment = self.appointments.find_by(appointment_time: half_hours_array[index-1])
                if appointment.treatment.duration == 60
                else
                    available_times << data_for_datetime_array(half_hours)
                end
            else
                available_times << data_for_datetime_array(half_hours)
            end
        end
        available_times
    end

    private

    def datetime_array_for_next_seven_days_at_midnight
        days_array = []
        day_counter = 1
        7.times do
            days_array << (Time.now + day_counter.days).at_midnight
            day_counter += 1
        end
        days_array
    end

    def datetime_array_for_each_working_half_hour
        half_hours_array = []
        datetime_array_for_next_seven_days_at_midnight.each do |day|
            half_hour_counter = 9.to_f
            17.times do
                half_hours_array << (day + half_hour_counter.hours)
                half_hour_counter += 0.5
            end
        end
        half_hours_array
    end

    def data_for_datetime_array(half_hours)
        [half_hours.strftime("%A, %B %e, %Y - %l:%M %P"), half_hours]
    end
end
