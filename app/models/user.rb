class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { in: 8..50 }
  
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user.authenticate(password)
      user
    else
      nil
    end
  end
end

