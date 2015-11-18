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

  describe "User friendship associations" do
    let(:user_1) { User.create(first_name: "Sherman", last_name: "Dog", email: "sherman@email.com", password: "password") }

    let(:user_2) { User.create(first_name: "Maggie", last_name: "Dog", email: "maggie@email.com", password: "password") }

    it "can add a friend" do
      user_1.friends << user_2
      expect(user_1.friends).to eq([user_2])
    end

    it "can reciprocate friendship" do
      user_2.inverse_friends << user_1
      expect(user_2.inverse_friends).to eq([user_1])
    end
  end

  describe "User breadcrumb associations" do
    let!(:user_1) { User.create(first_name: "Geraldine", last_name: "Biggsby", email: "geraldine@email.com", password: "password") }

    let!(:user_2) { User.create(first_name: "Reginald", last_name: "Stone", email: "reginald@email.com", password: "password") }

    it "can create breadcrumbs" do
      breadcrumb = Breadcrumb.create(body: "Hello!", found: false)
      user_1.created_breadcrumbs << breadcrumb
      expect(user_1.created_breadcrumbs.first).to be_a(Breadcrumb)
    end

    it "has received breadcrumbs" do
      breadcrumb = Breadcrumb.create(body: "Hey Geraldine", found: false)

      user_1.created_breadcrumbs << breadcrumb
      user_2.received_breadcrumbs << breadcrumb
      
      expect(user_2.received_breadcrumbs.first).to be_a(Breadcrumb)
    end
  end
end
