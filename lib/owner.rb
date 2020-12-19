class Owner
  attr_reader :species
  attr_accessor :name, :pets, :dog, :cat

  @@all = []
  @@pets = {:dogs => [], :cats => []}

  def initialize(name)
    @species = "human"
    @name = name
    @@all << self
  end

  def name=(name)
    raise NoMethodError if !name.is_a?(Cat || Dog)
  end

  def species=(species)
    raise NoMethodError if !species.is_a?(Cat || Dog)
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def pets
    @@pets
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end  
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end     
  end

  def buy_cat(name) 
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select do |dog|
      dog.mood = 'happy'
    end
  end

  def feed_cats
    Cat.all.select do |cat|
      cat.mood = 'happy'
    end
  end

  def sell_pets
    cats.each do |o| 
      o.mood = "nervous"
      o.owner = nil
    end
    cats.clear
    dogs.each do |o|
      o.mood = "nervous" 
      o.owner = nil
    end
    dogs.clear
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end