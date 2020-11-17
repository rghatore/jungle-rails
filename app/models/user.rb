class User < ActiveRecord::Base
  has_secure_password
  validates :first_name,
            :last_name,
            :password_confirmation,
            presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 } 

  def self.authenticate_with_credentials email, password
    @user = User.where("LOWER(email) = ?", email.downcase.strip)[0]
    if @user && @user.authenticate(password)
      @user
    else 
      nil
    end
  end

end
