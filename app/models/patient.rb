class Patient < ApplicationRecord
    has_many :appointments
    has_many :bills
    has_many :doctors, through: :appointments
    validates :patient_name, presence: true
    validates :phone_number, presence: true, length: {minimum: 13}
end
