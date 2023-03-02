class Api::V1::PatientInfoController < ApplicationController
  def index
    doctors = Doctor.all
    render json: doctors, status: 200
  end

  def show
    patient=[]
    doctor = Doctor.find(params[:id])
    doctor.appointments.each do |a|
      patient[0]= a.patient.patient_name
      patient[1]= a.patient.phone_number
    end
    if patient
      render json: patient, status:200
    else
      render json: {error: "Doctor not found"}
    end
  end
end
