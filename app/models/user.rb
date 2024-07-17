class User < ApplicationRecord
  has_many :exercises
  has_many :routines

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
