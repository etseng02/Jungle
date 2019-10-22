class User < ActiveRecord::Base

 has_secure_password

 validates :email, presence: true, uniqueness: { case_sensitive: false}
 validates :password, length: { minimum: 3 }
 validates :password_confirmation, length: { minimum: 3 }
 validates :password, presence: true

 def self.authenticate_with_credentials(email, password)
  email = email.strip.downcase
  @user = User.find_by(email: email)
  if @user && @user.authenticate(password)
    @user
  else
    nil
  end
end

end
