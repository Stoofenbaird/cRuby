class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :profile_name, presence: true, uniqueness: true
end
