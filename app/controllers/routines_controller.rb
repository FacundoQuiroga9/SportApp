class RoutinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_routine, only: [:show, :edit, :update, :destroy]

  def index
    @routines = current_user.routines.includes(:exercises)
  end

  def show
  end

  def new
    @routine = Routine.new
    @exercises = current_user.exercises
  end

  def create
    @routine = current_user.routines.build(routine_params)
    if @routine.save
      exercise_ids = params[:routine][:exercise_ids].flat_map { |id| id.split(',') }.map(&:to_i)
      exercise_ids.each do |id|
        RoutineExercise.create!(routine_id: @routine.id, exercise_id: id) unless RoutineExercise.exists?(routine_id: @routine.id, exercise_id: id)
      end
      redirect_to routines_path, notice: 'Routine was successfully created.'
    else
      @exercises = current_user.exercises
      render :new
    end
  end

  def edit
    @exercises = current_user.exercises
  end

  def update
    if @routine.update(routine_params)
      redirect_to @routine, notice: 'Routine was successfully updated.'
    else
      @exercises = current_user.exercises
      render :edit
    end
  end

  def destroy
    @routine.destroy
    redirect_to routines_path, notice: 'Routine was successfully deleted.'
  end

  private

  def set_routine
    @routine = Routine.find(params[:id])
  end

  def routine_params
    params.require(:routine).permit(:name, :category, exercise_ids: [])
  end
end

