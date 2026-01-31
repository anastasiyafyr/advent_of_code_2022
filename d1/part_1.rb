input_path = File.join(__dir__, 'input.txt')
groups = File.read(input_path).split("\n\n")

calories_per_elf = groups.map do |group|
  numbers = group.split("\n").map(&:to_i)
  numbers.sum
end

max_calories = calories_per_elf.max

p max_calories
