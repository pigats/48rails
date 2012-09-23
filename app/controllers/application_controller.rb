class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale


  private
   def set_locale
     http_requested_lang = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^(#{I18n.available_locales.join('|')})/)[0][0] unless request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^(#{I18n.available_locales.join('|')})/).empty?
     I18n.locale = params[:lang] || http_requested_lang || I18n.default_locale
   end

end
