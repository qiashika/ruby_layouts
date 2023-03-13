class PatientmailerMailer < ApplicationMailer
  def registration_confirmation(patient)
    @patient = patient
    mail(to: @patient.email_id, subject: "Registration Confirmation")
  end
end
