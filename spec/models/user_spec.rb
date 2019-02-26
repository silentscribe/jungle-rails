require 'rails_helper'

RSpec.describe User, type: :model do
  subject {described_class.new(first_name: 'Stanley', last_name: 'Stone', email: 'steve@steve.com', password: 'tttttttt', password_confirmation: 'tttttttt')}
  
  describe "Validations" do
    it "validates all user fields are present" do
      expect(subject).to be_valid
    end

    it "validates that password and password confirmation are the same" do
      subject.password_confirmation = 'pop'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to be_present
    end

    it "validates that email is unique" do
      will = User.new(first_name: 'Will', last_name: 'Williams', email: 'will@will.com', password: '90909090', password_confirmation: '90909090')
      will.save!
      subject.email = 'will@will.com'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to be_present
    end

    it "validates that password is within range" do
    end
  end
end
