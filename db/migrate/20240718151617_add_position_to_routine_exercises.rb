class AddPositionToRoutineExercises < ActiveRecord::Migration[7.1]
  def change
    add_column :routine_exercises, :position, :integer
  end
end
