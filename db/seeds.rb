conditions = [
['Interesado','primer estado, solo se tiene nombre y correo','ApplicantCondition'],
['Congelado','El postulante tiene mucho frio','ApplicantCondition'],
['Activo','El postulante tiene algun proceso de postulacion','ApplicantCondition'],
['Activa','Postulacion en proceso','PostulationCondition'],
['Pagada','Postulacion pagada','PostulationCondition'],
['Facturada','Postulacion facturada','PostulationCondition'],
['Planificada','Version planificada','VersionCondition'],
['Activa','Version activa','VersionCondition'],
['Cerrada','Version Cerrada','VersionCondition']
]

Condition.delete_all
conditions.each do |name, description, type|
	Condition.create!(name: name, description: description, type: type)
end

applicants = [['sbstn','jmnz','sbstn@jmnz.cl','password'],
['ruyard','fuster','ruyard@fuster.cl', 'password'],
['maca','standen','maca@standen.cl','password']]

Applicant.delete_all
conditions= Condition.where("type = 'ApplicantCondition'")
applicants.each do |name, last_name, email, password|
n = 0
condition_id = conditions.offset(n).first.id
	Applicant.create!(name: name, last_name: last_name, email: email, condition_id: condition_id)
n = n+1
end

admin_users = [
['admin@admin.com','password','admin'],
['sbstn@jmnz.com','password', 'admin'],
['digo@arias.com','password','admin'],
['user@admin.com','password','user']]

AdminUser.delete_all
admin_users.each do |email, password, role|
	AdminUser.create!(email: email, password: password, role: role)
end

program_list = [
['MBA Weekend','MBA para ejecutivos'],
['MFA','Master en finanzas'],
['MTI','Master en TI'],
['MBA Full Time','MBA a tiempo completo']] 

Program.delete_all
program_list.each do |title, description|
	Program.create!(title: title, description: description)
end

