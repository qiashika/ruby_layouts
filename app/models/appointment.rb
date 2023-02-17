class Appointment < ApplicationRecord

    belongs_to :doctor
    belongs_to :patient

    scope :doctor_fetch,->(appointment) {Doctor.where(id: appointment.doctor_id)}
    scope :patient_fetch,->(appointment) {Patient.where(id = appointment.patient_id)}
end
