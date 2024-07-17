class Routine < ApplicationRecord
  belongs_to :user
  has_many :routine_exercises, dependent: :destroy
  has_many :exercises, through: :routine_exercises

  CATEGORIES = ['Soccer', 'Basketball', 'Gym', 'Yoga', 'Running'].freeze

  CATEGORY_IMAGES = {
    'Soccer' => 'categories/soccer.jpg',
    'Basketball' => 'categories/basketball.jpg',
    'Gym' => 'categories/gym.jpg',
    'Yoga' => 'categories/yoga.jpg',
    'Running' => 'categories/running.jpg'
  }.freeze

  def category_image
    CATEGORY_IMAGES[category]
  end
end
