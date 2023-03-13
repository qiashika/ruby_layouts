class PatientController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end
  
  def create
    @patient = Patient.new (patient_params)

    if @patient.save
      PatientmailerMailer.registration_confirmation(@patient).deliver_now
      redirect_to @patient
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
  
    redirect_to patient_index_path, status: :see_other
  end

  private
  def patient_params
    params.require(:patient).permit(:patient_name, :phone_number, :email_id)
  end
end
