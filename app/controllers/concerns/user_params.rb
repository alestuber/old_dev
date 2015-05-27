class UserParams < Devise::ParameterSanitizer
  def sign_up
    default_params.permit :email, :password, :password_confirmation,
    :first_name, :last_name, :cpf, :telephone, :date_of_birth, :provider, :uid
  end

  def account_update
    default_params.permit :email, :password, :password_confirmation,
    :current_password, :first_name, :last_name, :cpf, :telephone,
    :date_of_birth, :provider, :uid
  end
end
