require_relative '../app/inventory'

RSpec.describe Inventory do
  subject { described_class.new }
  let(:product_list) do
    [
      { name: 'Coca Cola', code: 1, quantity: 0, price: 0.50 },
      { name: 'Sprite', code: 2, quantity: 1, price: 1.50 }
    ]
  end

  before do
    stub_const('Inventory::PRODUCTS', product_list)
  end

  describe '#find_product' do
    it 'raise error when product is out of stock' do
      expect { subject.find_product(1) }.to raise_error
    end

    it 'returns the product if it is in stock' do
      expect(subject.find_product(2)).to eq(product_list[1])
    end
  end

  describe '#send' do
    it 'returns the product if it is in stock' do
      expect(subject.send(2)).to eq(product_list[1])
    end

    it 'updates the quantity of products in stock' do
      expect { subject.send(2) }.to change { product_list[1][:quantity] }.from(1).to(0)
    end
  end
end
