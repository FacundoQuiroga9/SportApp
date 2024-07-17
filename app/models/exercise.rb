class Exercise < ApplicationRecord
  belongs_to :user
  has_many :routine_exercises, dependent: :destroy
  has_many :routines, through: :routine_exercises
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true


end
