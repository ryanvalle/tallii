class User < ActiveRecord::Base
	has_secure_password
	validates :username, uniqueness: true
	validates :password_digest, presence: true
	validates :username, presence: true
end
