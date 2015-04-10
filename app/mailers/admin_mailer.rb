class AdminMailer < ActionMailer::Base
	default from: 'no-reply@en1mes.com'
	default to: 'holdinggrupoone@gmail.com'
	layout 'mailer'
	
	def new_applicant(applicant)
		#Hacer que mande informacion al postulante tambien
		@applicant = applicant
		mail(subject: "New User: #{applicant.name} al curso")
	end

	def batch_mail(mail, asunto, texto)
		@texto = texto
		mail (to: mail, subject: asunto) 
	end
end
