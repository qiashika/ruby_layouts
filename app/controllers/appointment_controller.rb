class AppointmentController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @appointments = Appointment.all

  end

  def show
    @appointment = Appointment.find(params[:id])
  
  end

  def new
    @appointment = Appointment.new
  end
  
  def create
    @appointment = Appointment.new (appointment_params)

    if @appointment.save
      AppointmentMailer.appointment_confirmation(@appointment).deliver_now
      redirect_to @appointment
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      redirect_to @appointment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
  
    redirect_to appointment_index_path, status: :see_other
  end

  private
  def appointment_params
    params.require(:appointment).permit(:appointment_datetime, :patient_id, :doctor_id)
  end
end