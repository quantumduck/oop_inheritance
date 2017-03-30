class System

  attr_reader :bodies

  def initialize
    @bodies = []
  end

  def total_mass
    mass = 0
    @bodies.each do |body|
      mass += body.mass
    end
  end

end

class Body

  attr_reader :name
  attr_reader :mass

  def initialize(name, mass)
    @name = name
    @mass = mass
  end

end

class Planet < Body

  def Initialize(name, mass, day, year)
    super(name, mass)
    @day = day
    @year = year
  end

end

class Star < Body


end

class Moon < Body



end
