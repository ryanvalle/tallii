class User < ActiveRecord::Base
	has_secure_password
	validates :password_digest, presence: true
	validates :username, presence: true
end
