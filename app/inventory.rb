class Inventory
  PRODUCTS = [
    { name: 'Coca Cola', code: 1, quantity: 4, price: 0.50 },
    { name: 'Sprite', code: 2, quantity: 5, price: 1.50 },
    { name: 'Water', code: 3, quantity: 1, price: 2.25 },
    { name: 'Orange Juice', code: 4, quantity: 1, price: 0.25 }
  ].freeze

  def find_product(code)
    product = PRODUCTS.find { |p| p[:code] == code }
    raise "#{product[:name]} is out of stock" if product[:quantity].zero?
    product
  end

  def send(code)
    product = find_product(code)
    product[:quantity] -= 1
    p "#{product[:name]} payment completed successfully"
    product
  end
end
