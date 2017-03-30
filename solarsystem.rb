class System

  @@all_systems = []

  def self.total_mass
    mass = 0
    @@all_systems.each do |sys|
      mass += sys.total_mass
    end
  end

  attr_reader :bodies

  def initialize
    @bodies = []
    @@all_systems << self
  end

  def total_mass
    mass = 0
    @bodies.each do |body|
      mass += body.mass
    end
    mass
  end

  def add(newbody)
    already_there = false
    @bodies.each do |body|
      already_there = true if body.name == newbody.name
    end
    @bodies << newbody unless already_there
  end

end

class Body

  attr_reader :name
  attr_reader :mass

  def initialize(name, mass)
    @name = name.to_s
    @mass = mass.to_f
  end

end

class Planet < Body

  attr_accessor :moons

  def initialize(name, mass, day, year)
    super(name, mass)
    @day = day
    @year = year
    @moons = []
  end

end

class Star < Body

  def initialize(name, mass, type)
    super(name, mass)
    @type = type
  end

end

class Moon < Body

  def initialize(name, mass, month, planet)
    super(name, mass)
    @month = month
    @planet = planet
    @planet.moons << self
  end

end

ss = System.new
sun = Star.new("Sol", 333_000.0, :G)
ss.add(sun)
ear = Planet.new("Earth", 1.0, 1.0, 1.0)
ss.add(ear)
mer = Planet.new("Mercury", 0.0553, 175.95, 0.241)
ss.add(mer)
ven = Planet.new("Venus", 0.815, 243.0, 0.6152)
ss.add(ven)
mar = Planet.new("Mars", 0.107, 1.0271, 1.8809)
ss.add(mar)
moo = Moon.new("The Moon", 0.0123, 1.0, ear)
ss.add(moo)
puts ss.total_mass
