require_relative 'inventory'
require_relative 'order_processing'

class VendingMachine
  def initialize
    @order = OrderProcessing.new
    @stock = Inventory.new
  end

  def vend(code, amount)
    product = @stock.find_product(code)
    @order.insert_coin(amount)

    return @order.calc_missing_amount(product_price) if @order.balance < product[:price]
    return @stock.send(product[:code]) if @order.balance == product[:price]

    if @order.balance > product[:price]
      extra_amount = @order.balance - product[:price]
      @order.change(extra_amount)
      @stock.send(product[:code])
    end
  rescue StandardError => e
    p e.message
    @order.refund
  end
end

vending_machine = VendingMachine.new
vending_machine.vend(1, 5)
