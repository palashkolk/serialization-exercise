require 'yaml'

module BasicSerializable
  @@serializer = YAML

  def serialize
    obj = {}
    instance_variables.map do |var|
      obj[var] = instance_variable_get(var)
    end
    @@serializer.dump obj
  end

  def unserialize(string)
    obj = @@serializer.load(string)
    obj.keys.each do |key|
      instance_variable_set(key, obj[key])
    end
    obj
  end
end

class Person
  include BasicSerializable
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end
end

p = Person.new 'David', 28, 'male'
pers = Person.new 'sabir', 41, 'male'
p p.instance_variables
p p.serialize
p pers.serialize
p p.unserialize(pers.serialize)
p pers.unserialize(p.serialize)
# p pers
puts "Name: #{pers.name}"
puts "Age: #{p.age}"
puts "Gender: #{p.gender}"
