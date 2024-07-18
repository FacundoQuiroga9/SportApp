class RoutineExercise < ApplicationRecord
  belongs_to :routine
  belongs_to :exercise

  validates :routine_id, uniqueness: { scope: :exercise_id }

  default_scope { order(:position) }

end
