class ExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = current_user.exercises
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)
    if @exercise.save
      redirect_to exercises_path, notice: 'Exercise was successfully created.'
    else
      render :new
    end
  end

  def edit
    # Código para editar el ejercicio si es necesario
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to exercise_path(@exercise), notice: 'Exercise was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to exercises_path, notice: 'Exercise was successfully deleted.'
  end

  private

  def set_exercise
    @exercise = current_user.exercises.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :duration, :sets, :repetitions, :description, :photo, :category)
  end
end
