class AppointmentMailer < ApplicationMailer
  def created(appointment)
    @appointment = appointment

    mail(
      to: EmailAddress.first.email,
      subject: 'Прием был создан ' << l(DateTime.current, format: :full)
    )
  end
end
