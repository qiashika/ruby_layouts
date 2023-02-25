class Api::V1::DoctorController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token


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
  
  def create
    @doctor = Doctor.new(name: doctor_params[:name], 
    specialism: doctor_params[:specialism],
    cost: doctor_params[:cost]
    )

    if @doctor.save
      render json: @doctor, status: 200, location: @doctor
    else 
      render json: {error: "Cannot add new doctor"}
    end
  end

  def update
    doctor = Doctor.find(params[:id])

    if doctor.update(doctor_params)
      render json: "Updated successfully"
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
end
