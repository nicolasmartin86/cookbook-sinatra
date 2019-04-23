class Recipe
  attr_accessor :name, :description, :difficulty, :prep_time

  def initialize(name, description, difficulty, prep_time, is_done = false)
    @name = name
    @description = description
    @difficulty = difficulty
    @prep_time = prep_time
    @is_done = false
  end

  def done?
    @is_done
  end

  def mark_as_done
    @is_done = true
  end
end
