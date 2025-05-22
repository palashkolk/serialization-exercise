f = File.open('stones.txt')

while line = f.gets
  puts line
end

f.close
