require 'spec_helper'

describe User do
  let(:sherman) { User.new(first_name: "Sherman", last_name: "Dog", email: "sherman@email.com", password: "password") }

  it "creates a new User object" do
    expect(sherman).to be_a User
  end

  it "has a first name" do
    expect(sherman.first_name).to eq("Sherman")
  end

  it "has a last name" do
    expect(sherman.last_name).to eq("Dog")
  end

  it "has an email" do
    expect(sherman.email).to eq("sherman@email.com")
  end

  it "can authenticate its password" do
    expect(sherman.authenticate("password")).to eq(sherman)
  end

  describe "User validations" do

    it "is invalid without a first name" do
      user = User.new(first_name: nil, last_name: "Jones", email: "jones@email.com", password: "password")
      expect(user.valid?).to be(false)
    end

    it "is invalid without a last name" do
      user = User.new(first_name: "Bernard", last_name: nil, email: "jones@email.com", password: "password")
      expect(user.valid?).to be(false)
    end

    it "is invalid without an email" do
      user = User.new(first_name: "Bernard", last_name: "Jones", email: nil, password: "password")
      expect(user.valid?).to be(false)
    end

    it "is invalid without a password_digest" do
      user = User.create(first_name: "Bernard", last_name: "Jones", email: "jones@email.com", password: nil)
      expect(user.save).to be(false)
    end

  end
end
