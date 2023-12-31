class User < ApplicationRecord
  extend Devise::Models
  has_many :questions
  accepts_nested_attributes_for :questions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
