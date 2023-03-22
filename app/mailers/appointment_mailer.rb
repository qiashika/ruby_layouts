class AppointmentMailer < ApplicationMailer
  def appointment_confirmation(appointment)
    @appointment = appointment
    mail(to: @appointment.patient.email_id, subject: I18n.t("appointment confirmation",locale: @appointment.patient.language.presence))
  end
end
