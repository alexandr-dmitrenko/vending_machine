class ChangeMaker
  def initialize(coins)
    @coins = coins.sort
  end

  def change(amount)
    return [] if amount.zero?

    possible = @coins.find_all { |coin| coin <= amount }
    raise 'Machine does not have enough change' if possible.empty?

    best = possible.max
    index = @coins.index(best)
    @coins.tap { |i| i.delete_at(index) }

    [best, *change(amount - best)].sort
  end
end
