class CoinKeeper
  attr_reader :balance
  ACCEPTED_COIN_VALUES = [0.25, 0.50, 1, 2, 5].freeze

  def initialize
    @balance = 0
    @money_vault = {
      0.25 => 100,
      0.50 => 100,
      1 => 10,
      2 => 10,
      5 => 10
    }
  end

  def insert_coin(amount)
    return amount unless coin_value_allowed?(amount)

    @balance += amount
    @money_vault[amount] += 1
  end

  def return_change(product_price)
    amount = @balance - product_price

    change ||= {}

    until amount == 0 do
      amount, change = calculate_change(amount, change)
    end

    change
  end

  private

  def calculate_change(amount, change)
    Hash[@money_vault.sort { |a, b| b <=> a }].each do |k, v|
      next if amount == 0
      next if v < 1

      if amount % k == 0
        change[k] = change[k].nil? ? 1 : (change[k] + 1)
        @money_vault[k] -= 1
        amount -= k
      else
        if amount - k >= 0
          amount = amount - k
          change[k] = change[k].nil? ? 1 : (change[k] + 1)
        end
      end
    end

    [amount, change]
  end

  def coin_value_allowed?(amount)
    ACCEPTED_COIN_VALUES.include?(amount)
  end
end
