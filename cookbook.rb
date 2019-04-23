require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = [] # => instance of recipes
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  def load_csv
    CSV.foreach(@csv_file) do |row| # => Parsing
      @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4]) # => Build recipes instances for each row
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv| # => Storing
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.difficulty, recipe.prep_time, recipe.done?]
      end
    end
  end
end
