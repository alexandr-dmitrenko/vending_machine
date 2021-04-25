class ProductStock
  PRODUCTS = [
    { name: 'Coca Cola', code: 1, quantity: 5, price: 0.50 },
    { name: 'Sprite', code: 2, quantity: 5, price: 1.50 },
    { name: 'Water', code: 3, quantity: 1, price: 2.25 },
    { name: 'Orange Juice', code: 4, quantity: 1, price: 0.25 }
  ]

  def initialize(code)
    @code = code
  end

  def find_product
    PRODUCTS.find { |product| product[:code] == @code }
  end

  def product_withdrawal
    product = find_product
    product[:quantity] -= 1
    product
  end
end
