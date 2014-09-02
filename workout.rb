require "pry"
class Workout
  def initialize(id, date, exercise)
    @id = id
    @date = date
    @exercise = exercise
  end

  def id
    @id
  end

  def date
    @date
  end

  def type
    ## count number of cardio, number of strength, number of total
    total = 0
    cardio = 0
    strength = 0
    @exercise.each do |type|
      total += 1
      if type[:category] == "cardio"
        cardio += 1
      elsif type[:category] == "strength"
        strength += 1
      else
      end
    end

    if cardio != 0 && cardio.to_f/total.to_f >= 0.5
      @type = "cardio"
    elsif strength != 0 && strength.to_f/total.to_f >= 0.5
      @type = "strength"
    else
      @type = "other"
    end
  end

  def duration
    @duration = 0
    @exercise.each do |exercise|
      @duration += exercise[:duration_in_min]
    end
    @duration
  end

  def calories_burned
    @calories_burned = 0

    @exercise.each do |exercise|
      intensity = 0
      if exercise[:intensity] == "high"
        intensity = 10
      elsif exercise[:intensity] == "medium"
        intensity = 8
      elsif exercise[:intensity] == "low" || exercise[:category] == "strength"
        intensity = 5
      else
        intensity = 6
      end

    @calories_burned += (intensity.to_f * exercise[:duration_in_min].to_f)
    end
    @calories_burned
  end
end




