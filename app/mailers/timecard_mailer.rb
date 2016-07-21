class TimecardMailer < ApplicationMailer
	
	def payroll_mailer(data)
    @data = data
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
	
end
