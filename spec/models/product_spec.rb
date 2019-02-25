require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.new(name: "something") }
  subject { described_class.new(name: "something", price: 222, quantity: 12, category: category) }

  describe 'Validations' do
    it "validates all required fields are present" do
      expect(subject).to be_valid
    end

    it "validates that name is present" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to be_present
    end

    it "validates that price is present" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to be_present
    end
    
    it "validates that quantity is present" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to be_present
    end

    it "validates that name is present" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to be_present
    end
  end
end
