f = File.open("input.txt")
f_lines = f.read.split("\n")

input = f_lines[0].gsub /\[(.*)\]/, '\1'
clear_input = input.split(",")
count = f_lines.count
index = 1
array = []

clear_input.each do |i|
    if(i.to_i == 0)
        array << i.delete(' \\"')
    else
        array << i.to_i
    end
end

while(count > 1)
    value = f_lines[index].strip
    if value.empty?
        puts "No input provided!"
    elsif !value.scan(/\D/).empty?
        puts "Exception : #{f_lines[index]} is a string!"
    elsif array.count(value.to_i) > 1
        puts "Exception : #{f_lines[index].to_i} is a duplicate entry!"
    elsif array.count(value.to_i) == 0
        puts "Exception : #{f_lines[index].to_i} is not in the list!"
    else
        array.each_with_index do |val, idx|
            a = value.to_i + val.to_i
            if(idx != array.index(value.to_i) && (value.to_i != a.to_i) && array.count(a) > 0)
                puts "#{value.to_i} is SUPPORTED BY THE NUMBER #{a}"
                break
            end
        end
    end
    index += 1
    count -= 1
end