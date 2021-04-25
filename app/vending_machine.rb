require_relative 'product_stock'
require_relative 'coin_keeper'
require 'pry'

class VendingMachine
  # Отображать только доступные товары
  def self.vend(code, amount)
    stock = ProductStock.new(code)
    product = stock.find_product

    coin_keeper = CoinKeeper.new
    coin_keeper.insert_coin(amount)

    if coin_keeper.balance < product[:price]
      puts "There are not enough funds in the account. Please deposit #{product[:price] - @balance}"
    end

    return stock.product_withdrawal if coin_keeper.balance == product[:price]

    if coin_keeper.balance > product[:price]
      change = coin_keeper.return_change(product[:price])

      stock.product_withdrawal
      change
    end
  end
end

VendingMachine.vend(1, 5)
