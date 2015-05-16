class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :telephone, presence: true, length: { maximum: 11 }, numericality: true
  validates :date_of_birth, presence: true
  validates :cpf, presence: true, length: { is: 11 }, uniqueness: true, numericality: true
end
