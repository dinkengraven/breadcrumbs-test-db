class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: :friend_id
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :created_breadcrumbs, class_name: "Breadcrumb", foreign_key: :creator_id
  has_many :received_breadcrumbs, class_name: "Breadcrumb", foreign_key: :receiver_id

  validates :first_name, { presence: true }
  validates :last_name, { presence: true }
  validates :email, { presence: true, uniqueness: true }
  validates :password_digest, { presence: true }

  has_secure_password
end
