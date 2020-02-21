class ApplicationController < ActionController::Base
  # before_action :ganko
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :set_card
  before_action :set_address

  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthdate_year, :birthdate_month, :birthdate_day, :phone_number])
  end

  private
  def set_address
    if user_signed_in?
      @address = Address.find_by(user_id: current_user.id)
    end
  end

  def set_card
    if user_signed_in?
      @card = current_user.cards.first
    end
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end