require 'spec_helper'

describe User do

  let(:user) {FactoryGirl.create(:user)}

  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  it "is unique in the database" do
    User.create(name: "Cameron Kid", email: "testingforspecs@gmail.com", password: "test123!", password_confirmation: "test123!").should be_valid
    User.create(name: "Fake Imposter", email: "testingforspecs@gmail.com", password: "test123!", password_confirmation: "test123!").should_not be_valid
  end

  it "should have a schedule when created" do
    expect(user.schedule).to be_valid
  end

  it "should have a profile picture" do

  end
end