class UserMailer < ApplicationMailer
  default :from => 'usmanasif@crosshairtechnology.com'

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to MetaStash')
      end
end
