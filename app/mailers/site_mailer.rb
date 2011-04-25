class SiteMailer < ActionMailer::Base
  default :to => "lvalente@saintvallen.com"
  
  def contact(params)
    mail(:from => "#{params[:name]} <#{params[:email]}>", :subject => "[Saint Vallen] Contato pelo site",
    :body => "
    Email: #{params[:email]}\n
    Nome: #{params[:name]}\n
    Telefone: #{params[:phone]}\n
    Mensagem: #{params[:message]}")
  end
end
