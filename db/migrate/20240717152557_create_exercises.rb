class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :duration
      t.integer :sets
      t.integer :repetitions
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
