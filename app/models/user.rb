class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :propositions, dependent: :destroy
  has_many :group_users
  has_many :groups, through: :group_users
  has_one :profile

  acts_as_followable # フォロワー機能
  acts_as_follower   # フォロー機能
end
