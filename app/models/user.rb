class User < ActiveRecord::Base
  has_secure_password

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: :friend_id
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  validates :first_name, { presence: true }
  validates :last_name, { presence: true }
  validates :email, { presence: true, uniqueness: true }
  validates :password_digest, { presence: true }
end
