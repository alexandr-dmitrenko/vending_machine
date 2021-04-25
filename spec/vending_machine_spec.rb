require_relative '../app/vending_machine'

RSpec.describe VendingMachine do
  context "with no items" do
    it "behaves one way" do
      expect(1+1).to eq(2)
    end
  end
end