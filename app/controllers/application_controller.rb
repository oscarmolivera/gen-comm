class ApplicationController < ActionController::Base
  add_flash_types :info, :warning
  before_action :authenticate_user!
  before_action :set_locale
  layout :layout_by_resource

  private

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end
end
