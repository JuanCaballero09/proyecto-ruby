class ApplicationMailer < ActionMailer::Base
  default from: "santiagozambrano751@gmail.com" # Esto es de donde van a salir los correos hacia las personas que olviden su contraseña
  layout "mailer"
end
