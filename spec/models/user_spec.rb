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

    it "validates that email is unique" do
      will = User.new(first_name: 'Will', last_name: 'Williams', email: 'will@will.com', password: '90909090', password_confirmation: '90909090')
      will.save!
      subject.email = 'will@WILL.COM'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to be_present
    end

    it "validates that password is not too short and within range" do
      subject.password = "f4g"
      subject.password_confirmation = "f4g"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to be_present
    end
  end

  describe ".authenticate_with_credentials" do
    it "authenticates user login credentials" do
      subject.save!
      user = User.authenticate_with_credentials(subject.email, subject.password)
      expect(user).to_not be_nil
    end

    it "authenticates user login credentials if not user" do
      user = User.authenticate_with_credentials(subject.email, subject.password)
      expect(user).to be_nil
    end

    it "authenticates user login credentials if extra spaces" do
      subject.save!
      user = User.authenticate_with_credentials(" steve@steve.com ", subject.password)
      expect(user).to_not be_nil
    end

    it "authenticates user login credentials if wrong case" do
      subject.save!
      user = User.authenticate_with_credentials("steve@Steve.com ", subject.password)
      expect(user).to_not be_nil
    end
  end
end
