class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows.push(show)
  end

  def full_character_list
    @shows.map do |show|
      show.characters
    end.flatten
  end

  def highest_paid_actor
    full_character_list.max_by do |char|
      char.salary
    end.actor
  end

  def payroll
    # hash with key of name and value of salary
    full_character_list.reduce({}) do |payroll, char|
      # require "pry"; binding.pry
      payroll[char.actor] = char.salary
      payroll
    end
  end
end

# !!!! I understand reduce now! yay!
