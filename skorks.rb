require 'yaml'

class A
  def initialize(string, number)
    @string = string
    @number = number
  end

  def to_s
    "In A:\n    #{@string},   #{@number}\n"
  end
end

File.open('/home/sabir/repos/serialization-exercise/blah.yaml', 'w') do |file|
  (1..10).each do |index|
    file.puts YAML.dump(A.new('Hello World', index))
    file.puts ''
  end
end

array = []
File.open('/home/sabir/repos/serialization-exercise/blah.yaml', 'r').each do |object|
  array << YAML.load(object)
end

puts array
