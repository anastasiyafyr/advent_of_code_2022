# --- Day 2: Rock Paper Scissors ---
# Part Two

input_path = File.join(__dir__, 'input.txt')
lines = File.readlines(input_path, chomp: true)

formatted_lines = lines.map(&:split)

opponent_map = {
  "A" => :rock,
  "B" => :paper,
  "C" => :scissors
}

our_map = {
  "X" => :lose,
  "Y" => :draw,
  "Z" => :win
}

beats = {
  rock: :scissors,
  paper: :rock,
  scissors: :paper
}

loses_to = beats.invert

shape_score = {
  rock: 1,
  paper: 2,
  scissors: 3
}

outcome_score = {
  win: 6,
  draw: 3,
  lose: 0
}

rounds = formatted_lines.map do |opp, outcome|
  [opponent_map[opp], our_map[outcome]]
end

total_score = 0

rounds.each do |opp, outcome|
  case outcome
  when :win
    my_shape = loses_to[opp]
  when :draw
    my_shape = opp
  when :lose
    my_shape = beats[opp]
  end

  round_score = shape_score[my_shape] + outcome_score[outcome]
  total_score += round_score
end

puts total_score
