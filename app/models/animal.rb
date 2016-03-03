class Animal
  attr_reader :id, :name, :environment, :image_url

  @@store = []

  def initialize(params)
    params.each do |attribute, value|
      self.send("#{attribute}=", value)
    end

  end

  def to_partial_path
    '/animals/animal'
  end

  def self.new_from_json(array)
    @@store = []
    array.each do |animal_info|
      @@store << self.new(animal_info)
    end
    @@store
  end

  def self.sort_by_environment
    envi_store = {}
    @@store.each do |animal|
      if envi_store.include? animal.environment
        increment = envi_store[animal.environment][:population] + 1
        envi_store[animal.environment][:population] = increment
        envi_store[animal.environment][:inhabitants] << animal
      else
        envi_store[animal.environment] = {population: 1, inhabitants:[]}
        envi_store[animal.environment][:inhabitants] << animal
      end
    end
    envi_store
  end

  def method_missing(m, *args, &block)
    puts "Sorry, #{m} is not an attribute of the Animal class."
  end

  private
  attr_writer :id, :name, :environment, :image_url

end
