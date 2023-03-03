class Api::V1::DoctorController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_doctor, only: [:update, :show, :destroy]


  def index
    doctors = Doctor.all
    render json: doctors, status: 200
  end

  def show
    doctor = Doctor.find(params[:id])
    if doctor
      render json: doctor, status: 200
    else
      render json: {error: "Doctor not found"}
    end
  end
  def display
    doctor = Doctor.find(params[:id])
    if doctor
      render json: doctor, status: 200
    else
      render json: {error: "Doctor not found"}
    end
  end

  def create
    doctor = Doctor.new(name: doctor_params[:name], 
    specialism: doctor_params[:specialism],
    cost: doctor_params[:cost]
    )

    if doctor.save
      render json: doctor, status: 200
    else 
      render json: {error: "Cannot add new doctor"}
    end
  end

  def update
    doctor = Doctor.find(params[:id])
    if doctor.update(doctor_params)
      binding.pry

      render json: doctor, message: "Updated successfully"
    else
      render json: {error: "Failed to update"}
    end
  end

  def destroy
    doctor = Doctor.find(params[:id])
    doctor.destroy
  
    render json: "Deleted successfully"
  end

  private
  def doctor_params
    params.require(:doctor).permit(:name, :specialism, :cost)
  end
  def set_doctor
    doctor = Doctor.find(params[:id])
  end
end
