class UserMailer < ApplicationMailer
  default :from => 'usman.asif2208@gmail.com'

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to MetaStash')
      end

      def forget_email(user)
        @user = user
        mail(to: @user.email, subject: 'Reset Password for MetaStash')
      end

end
