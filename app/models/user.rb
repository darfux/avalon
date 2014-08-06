class User < ActiveRecord::Base
  has_secure_password
  validates :account, presence: true, uniqueness: true
end
