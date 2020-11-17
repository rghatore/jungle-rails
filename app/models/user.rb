class User < ActiveRecord::Base
  has_secure_password
  validates :first_name,
            :last_name,
            :password_confirmation,
            presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 } 
end
