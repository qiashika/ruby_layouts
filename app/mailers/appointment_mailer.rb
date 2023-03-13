class AppointmentMailer < ApplicationMailer
    def appointment_confirmation(appointment)
        @appointment = appointment
        mail(to: @appointment.patient.email_id, subject: "Appointment Confirmation")
      end
end
