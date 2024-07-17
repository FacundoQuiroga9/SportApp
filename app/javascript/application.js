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
    });
  });

    // Agregar verificación de los formularios
    const formValidation = document.querySelector('.needs-validation');
    if (formValidation) {
      formValidation.addEventListener('submit', (event) => {
        if (!formValidation.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        formValidation.classList.add('was-validated');
      });
    }

    
});
