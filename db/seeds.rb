
Exercise.destroy_all
RoutineExercise.destroy_all
Routine.destroy_all
User.destroy_all

# Crear un usuario de prueba
user = User.create!(
  email: 'test@example.com',
  password: 'password',
  password_confirmation: 'password'
)

# Definir las categorías y los ejercicios
categories = {
  'Soccer' => [
    { name: 'Dribbling', description: 'Practice your dribbling skills.', duration: 15 },
    { name: 'Shooting', description: 'Improve your shooting accuracy.', repetitions: 20, sets: 3 },
    { name: 'Passing', description: 'Enhance your passing techniques.', duration: 10 },
    { name: 'Defending', description: 'Work on your defending strategies.', repetitions: 15, sets: 2 },
    { name: 'Goalkeeping', description: 'Train as a goalkeeper.', duration: 20 }
  ],
  'Basketball' => [
    { name: 'Free Throws', description: 'Perfect your free throws.', repetitions: 30, sets: 4 },
    { name: 'Layups', description: 'Practice layups.', repetitions: 20, sets: 3 },
    { name: 'Three-pointers', description: 'Improve your three-point shooting.', repetitions: 25, sets: 4 },
    { name: 'Dribbling Drills', description: 'Enhance your dribbling skills.', duration: 15 },
    { name: 'Defense Drills', description: 'Work on defensive maneuvers.', duration: 10 }
  ],
  'Gym' => [
    { name: 'Bench Press', description: 'Build your chest muscles.', repetitions: 10, sets: 3 },
    { name: 'Squats', description: 'Strengthen your legs.', repetitions: 12, sets: 4 },
    { name: 'Deadlift', description: 'Increase your overall strength.', repetitions: 8, sets: 3 },
    { name: 'Pull-ups', description: 'Work on your back muscles.', repetitions: 15, sets: 3 },
    { name: 'Planks', description: 'Improve your core stability.', duration: 5 }
  ],
  'Yoga' => [
    { name: 'Sun Salutation', description: 'Start your day with sun salutations.', duration: 10 },
    { name: 'Tree Pose', description: 'Balance and calm your mind.', duration: 5 },
    { name: 'Warrior Pose', description: 'Strengthen your legs and core.', duration: 5 },
    { name: 'Bridge Pose', description: 'Open your chest and hips.', duration: 10 },
    { name: 'Child\'s Pose', description: 'Relax and restore your energy.', duration: 5 }
  ],
  'Running' => [
    { name: 'Warm-up Jog', description: 'Start with a light jog.', duration: 10 },
    { name: 'Sprints', description: 'Improve your speed.', duration: 5 },
    { name: 'Long Run', description: 'Build your endurance.', duration: 30 },
    { name: 'Cool-down Walk', description: 'End with a cool-down walk.', duration: 10 },
    { name: 'Interval Training', description: 'Alternate between sprints and jogging.', duration: 20 }
  ]
}

# Crear ejercicios para cada categoría
categories.each do |category, exercises|
  exercises.each do |exercise_data|
    exercise = Exercise.create!(
      name: exercise_data[:name],
      description: exercise_data[:description],
      duration: exercise_data[:duration],
      repetitions: exercise_data[:repetitions],
      sets: exercise_data[:sets],
      user: user,
      category: category
    )

    # Adjuntar la imagen al ejercicio
    exercise.photo.attach(io: File.open(Rails.root.join('app/assets/images/exercises', "#{exercise_data[:name].downcase.gsub(' ', '_')}.jpg")), filename: "#{exercise_data[:name].downcase.gsub(' ', '_')}.jpg")
  end
end

puts "Seed data created successfully!"
