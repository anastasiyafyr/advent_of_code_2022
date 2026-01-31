# --- Day 2: Rock Paper Scissors ---
# Part One

input_path = File.join(__dir__, 'input.txt')
lines = File.readlines(input_path, chomp: true)

formatted_lines = lines.map(&:split)

opponent_map = {
  "A" => :rock,
  "B" => :paper,
  "C" => :scissors
}

our_map = {
  "X" => :rock,
  "Y" => :paper,
  "Z" => :scissors
}

rounds = formatted_lines.map do |opp, me|
  [opponent_map[opp], our_map[me]]
end

beats = {
  rock: :scissors,
  paper: :rock,
  scissors: :paper
}

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

total_score = 0

rounds.each do |opp, me|
  round_score = shape_score[me]

  if opp == me
    total_score += outcome_score[:draw]
  elsif beats[me] == opp
    total_score += outcome_score[:win]
  end

  total_score += round_score
end

puts total_score
