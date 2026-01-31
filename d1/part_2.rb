input_path = File.join(__dir__, 'input.txt')
groups = File.read(input_path).split("\n\n")

calories_per_elf = groups.map do |group|
  numbers = group.split("\n").map(&:to_i)
  numbers.sum
end

top_three_elves_calories = calories_per_elf.sort.reverse.take(3)

puts top_three_elves_calories.sum
