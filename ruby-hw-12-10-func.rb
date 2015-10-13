puts "Parsing.."

file = File.open('data.csv')

file.gets

people = []

while line = file.gets
  people << line.split(/,/)
end

people.sort! { |x,y| x[1] <=> y[1] }

puts people

file.close
