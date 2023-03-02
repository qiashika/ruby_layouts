class Api::V1::PatientController< ApplicationController
  def index
    doctors = Doctor.all
    render json: doctors, status: 200
  end

  def show
    patient_list=[]
    doctor = Doctor.find(params[:id])
    doctor.appointments.each do |a|
      patient = {"name" => a.patient.patient_name, "phone_number" => a.patient.phone_number}
      patient_list.push(patient)
    end
    if patient_list
      render json: patient_list, status:200
    else
      render json: {error: "Doctor not found"}
    end
  end

  def display
    patient_list=[]
    doctor = Doctor.find(params[:id])
    doctor.appointments.each do |a|
      patient = {"name" => a.patient.patient_name, "phone_number" => a.patient.phone_number}
      patient_list.push(patient)
    end
    if patient_list
      render json: patient_list, status:200
    else
      render json: {error: "Doctor not found"}
    end
  end
end
