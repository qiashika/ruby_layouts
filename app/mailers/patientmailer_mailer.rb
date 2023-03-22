class PatientmailerMailer < ApplicationMailer
  def registration_confirmation(patient)
    @patient = patient
    mail(to: @patient.email_id, subject: I18n.t("registration confirmation",locale: @patient.language.presence))
  end
end
