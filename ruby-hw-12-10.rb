class CSVParser

  def initialize
    @result = []
  end

  def result
    @result
  end

  def parse(filename = '')

    return nil if filename == '' || filename == nil

    file = File.open filename
    line = file.gets

    while line = file.gets
      @result << line.split(/,/).collect { |str| str.strip }
    end

    file.close
  end

  def method_missing(name)
    # @file = File.open @filename

    sorted_field = name[8..-1]
    case sorted_field
    when 'age'
      sorted_index = 1;
    when 'phone'
      sorted_index = 2
    when 'address'
      sorted_index = 3;
    when 'comment'
      sorted_index = 4;
    else
      sorted_index = 0;
    end

    @result.sort! { |person_1, person_2| person_1[sorted_index] <=> person_2[sorted_index] }

    # @file.close
  end

end

parser = CSVParser.new

parser.parse "data.csv"

result = parser.sort_by_address
# print result

result.each do |name, age, phone, address, comment|
  puts "Name: #{name}"
  puts "Age: #{age}"
  puts "Phone: #{phone}"
  puts "Address: #{address}"
  puts "Comment: #{comment}"
  puts ""
end
