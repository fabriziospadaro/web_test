class ApplicationMailer < ActionMailer::Base
  default from: "pubbrothers1@gmail.com"
  layout 'mailer'

  def reservation(params)
    @nominativo = params["user"]
    persone = params["peoples"].values[0]
    @telefono = params["phone"]
    data = params["reservation_date"].values[0]
    @time = params["reservation_time"].values[0]
    message = "#{@nominativo} ha richiesto una prenotazione il #{data} alle #{@time} per #{persone} persone. Numero di telefono: #{@telefono}"
    mail(to: "pubbrothers1@gmail.com", subject: message)
  end
end
