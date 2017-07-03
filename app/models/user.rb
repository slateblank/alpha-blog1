class User < ActiveRecord::Base
        has_many :articles, dependent: :destroy #dependent_destroy - destroys articles if user deleted
        before_save { self.email = email.downcase } #emails saved lowercase
        validates :username, presence: true, 
                uniqueness: { case_sensitive: false }, 
                length: { minimum: 3, maximum: 25 }
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        validates :email, presence: true, length: { maximum: 105 },
                uniqueness: { case_sensitieve: false },
                format: { with: VALID_EMAIL_REGEX }
                has_secure_password
end