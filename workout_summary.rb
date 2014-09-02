require_relative 'workout'
require 'csv'
require 'pry'
require 'table_print'

# create a hash of workout info from CSV
def load_workout_data(filename)
  workouts = {}

  CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |row|
    workout_id = row[:workout_id]

    if !workouts[workout_id]
      workouts[workout_id] = {
        date: row[:date],
        exercises: []
      }
    end

    exercise = {
      name: row[:exercise],
      category: row[:category],
      duration_in_min: row[:duration_in_min],
      intensity: row[:intensity]
    }

    workouts[workout_id][:exercises] << exercise
  end

  workouts
end

workouts = load_workout_data('workouts.csv')

all_workouts = []
workouts.each do |key, value|
  id = key ##key (number)
  date = value[:date]
  exercise = value[:exercises]
  workout1 = Workout.new(id, date, exercise)
  ## create hash or array from Workout class
  all_workouts << workout1
end

tp all_workouts, [:id, :date, :type, :duration, :calories_burned]

# YOUR CODE HERE
