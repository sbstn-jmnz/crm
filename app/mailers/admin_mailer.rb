class AdminMailer < ActionMailer::Base
	default from: 'no-reply@en1mes.com'
	default to: 'sjimenez@plastikilo.cl'
	layout 'mailer'
	def new_applicant()
		#@applicant = applicant
		mail(subject: "New User: ")
	end

	def batch_mail(mail, asunto, texto)
		@texto = texto
		mail (to: mail, subject: asunto) 
	end
end
