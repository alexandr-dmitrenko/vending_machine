require_relative '../app/order_processing'

RSpec.describe OrderProcessing do
  subject { described_class.new }
  let(:product_list) do
    [
      { name: 'Coca Cola', code: 1, quantity: 1, price: 2 },
      { name: 'Sprite', code: 2, quantity: 1, price: 1.50 }
    ]
  end

  before do
    stub_const('Inventory::PRODUCTS', product_list)
  end

  it '#change' do
    expect_any_instance_of(ChangeMaker).to receive(:change).with(5)
    subject.change(5)
  end

  it '#refund' do
    expect_any_instance_of(ChangeMaker).to receive(:change).with(subject.balance)
    subject.refund
  end

  it '#calc_missing_amount' do
    subject.insert_coin(0.5)
    expect(subject.calc_missing_amount(2)).to eq("Not enough money to pay. Deposit another 1.5")
  end

  describe '#insert_coin' do
    it 'raises an error when customer use unsupported coin' do
      expect { subject.insert_coin(10) }.to raise_error
    end

    it 'increases balance' do
      expect { subject.insert_coin(5) }.to change { subject.balance }.to(5)
    end

    it 'adds coins to storage' do
      subject.instance_variable_set(:@coins, [0.25, 0.50])
      expect { subject.insert_coin(1) }.to change { subject.instance_variable_get(:@coins).size }.to(3)
    end
  end
end
