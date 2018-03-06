class ApplicationsMailer < ApplicationMailer
  def no_consideration(user, job)
    @job = job
    @user = user
    @url  = 'http://example.com/login'
    mail to: @user.email.to_s, subject: 'Thankyou for your Interest', template_name: 'no_consideration'
  end

  def congratulations(user, job)
    @job = job
    @user = user
    @url  = 'http://example.com/login'
    mail to: @user.email.to_s, subject: 'Congratulations!', template_name: 'selected'
  end
end
