class UserMailer < ActionMailer::Base
  default :from => "Crestas Y Lechugas <correo@crestasylechugas.org>"
  HOST = Rails.env.production? ? "crestasylechugas.org" : "localhost:3000"
  default_url_options[:host] = HOST

  helper :messages

  def new_message_email(user, message, root)
    @user = user
    @root = root
    @message = message
    date = Time.now.strftime("%d/%m/%Y")
    mail(:to => user.email, :subject => "[CyL #{date}] - #{root.title}")
  end

end
