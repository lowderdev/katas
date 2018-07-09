def runoff(ballots)
  candidates = {}
  # ballot_count = 0
  least_popular = []
  min_num_votes = 0
  ballots.each do |ballot|
    # ballot_count += 1
    candidates.include?(ballot[0]) ? candidates[ballot[0]] += 1 : candidates[ballot[0]] = 1
  end

  if candidates.max / ballot_turnout > 0.5
    return candidates.max
  else
    min_num_votes = candidates.min[1]
    candidates.select { |candidate| candidate[1] == min_num_votes } #=> [Gary, Jill]
    ballots.select { |ballot| ballot[0]  }
  end
end


# Pseudocode
#
# make hash of all candidates and their first round tally
# check if there is >50% winner
# if no winner
#   fewest_votes
#   which candidates got min_num_votes
#   what are the second choice votes of ballots where first choice candidate was loser and add those to remaining candidates (unless vote was for one of the losers)
#   go back
