class SiteController < ApplicationController
  VALID_LANGS = %w{pt en es}
  caches_page :index
  
  def index
    return redirect_to '/pt' unless VALID_LANGS.include?(params[:lang])
    I18n.locale = params[:lang]
  end
  
  def cache
    render :text => VALID_LANGS.map{|lang| File.delete("#{Rails.root}/public/#{lang}.html") rescue "#{lang} not found" }.join("<br />")
  end
  
  def contact
    Site.create(:name => params[:name], :email => params[:email], :phone => params[:phone])
    SiteMailer.contact(params).deliver
    render :json => {:ok => true}.to_json
  rescue 
    render :json => {:ok => false}.to_json
  end
  
end
