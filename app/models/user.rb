class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:facebook]
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :telephone, presence: true, length: { maximum: 12 }, numericality: true
  validates :date_of_birth, presence: true
  validates :cpf, presence: true, length: { is: 11 }, uniqueness: true, numericality: true

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first || User.new
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data == session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.first_name = data["first_name"] if user.first_name.blank?
        user.last_name = data["last_name"] if user.last_name.blank?
        user.provider = :facebook
        user.uid = data["id"]
      end
    end
  end
end
