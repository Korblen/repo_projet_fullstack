class UserMailer < ApplicationMailer
  default from: ENV["MAILJET_DEFAULT_FROM"]

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://yannrezigui.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def attendance_alert(admin, user)
    @admin = admin
    @user = user
    @event = @user.events.last if @user.events.any?
    mail(to: @admin.email, subject: 'Nouvelle participation à votre événement')
  end
end