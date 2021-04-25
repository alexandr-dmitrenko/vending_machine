require_relative 'change_maker'

class OrderProcessing
  attr_reader :balance

  ALLOWED_COINS = [0.25, 0.50, 1, 2, 5].freeze

  def initialize
    @balance = 0
    @coins = [0.25, 0.50, 1, 1, 2, 5]
  end

  def insert_coin(coin)
    raise unprocessable_entity unless ALLOWED_COINS.include?(coin)
    @coins << coin
    @balance += coin
  end

  def change(amount)
    change_maker.change(amount)
  end

  def refund
    change_maker.change(@balance)
  end

  def calc_missing_amount(product_price)
    missing_amount = product_price - @balance
    "Not enough money to pay. Deposit another #{missing_amount}"
  end

  private

  def change_maker
    ChangeMaker.new(@coins)
  end

  def unprocessable_entity
    "The following types of coins are accepted for payment: #{ALLOWED_COINS.join(', ')}"
  end
end
