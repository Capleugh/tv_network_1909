class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows.push(show)
  end

  def highest_paid_actor
    characters = @shows.map do |show|
      show.characters
    end.flatten

    characters.max_by do |char|
      char.salary
    end.actor
  end

  def payroll
    # you want a hash with key of name and value of salary
    characters = @shows.map do |show|
      show.characters
    end.flatten

    characters.reduce({}) do |payroll, char|
      # require "pry"; binding.pry
      payroll[char.actor] = char.salary
      payroll
    end
  end
end
