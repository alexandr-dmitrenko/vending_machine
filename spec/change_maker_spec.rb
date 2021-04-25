require_relative '../app/change_maker'

RSpec.describe ChangeMaker do
  describe '#change' do
    let(:coins) { [0.25, 0.50, 5] }
    subject { described_class.new(coins) }

    it 'raise error when machine does not have enough change' do
      expect { subject.change(4.5) }.to raise_error
    end

    it 'returns the coins of the correct denomination' do
      expect(subject.change(0.75)).to contain_exactly(0.25, 0.50)
    end
  end
end
