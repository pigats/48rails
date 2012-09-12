class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery

  private
   def set_locale
     http_requested_lang = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^({I18n.available_locales.join('|')})/).first
     I18n.locale = params[:lang] || http_requested_lang || I18n.default_locale
   end

   def default_url_options(options={})
     return { :locale => I18n.locale } if params[:lang]
     return {}
   end
end
