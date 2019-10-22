class User < ActiveRecord::Base

 has_secure_password

 validates :email, presence: true, uniqueness: { case_sensitive: false}
 validates :password, length: { minimum: 3 }
 validates :password_confirmation, length: { minimum: 3 }
 validates :password, presence: true

end
