class Doctor < ApplicationRecord
    has_many :appointments
    has_many :bills
    has_many :patients, through: :appointments
    has_and_belongs_to_many :chambers
    validates :name, presence: true
    validates :specialism, presence: true
end
