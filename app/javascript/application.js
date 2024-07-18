// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

document.addEventListener('turbo:load', () => {
  console.log('Turbo loaded');  // Verificación de carga
  const exerciseCards = document.querySelectorAll('.exercise-card');
  const selectedExercisesInput = document.getElementById('selected-exercises');

  let selectedExercises = [];

  exerciseCards.forEach(card => {
    card.addEventListener('click', () => {
      const exerciseId = card.getAttribute('data-exercise-id');
      if (card.classList.contains('selected')) {
        card.classList.remove('selected');
        selectedExercises = selectedExercises.filter(id => id !== exerciseId);
      } else {
        card.classList.add('selected');
        selectedExercises.push(exerciseId);
      }
      selectedExercisesInput.value = selectedExercises.join(',');
      updateExerciseNumbers();
    });
  });

  function updateExerciseNumbers() {
    exerciseCards.forEach(card => {
      const exerciseId = card.getAttribute('data-exercise-id');
      const numberBadge = card.querySelector('.exercise-number');
      if (selectedExercises.includes(exerciseId)) {
        numberBadge.textContent = selectedExercises.indexOf(exerciseId) + 1;
        numberBadge.style.display = 'block';
      } else {
        numberBadge.style.display = 'none';
      }
    });
  }

  updateExerciseNumbers();
});

