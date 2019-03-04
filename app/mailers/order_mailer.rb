class OrderMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def confirm_cart(order)

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: User.find(1), subject: 'Bienvenue chez nous !') 
  end
end
