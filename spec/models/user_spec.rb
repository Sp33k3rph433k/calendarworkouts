require 'spec_helper'

describe User do

  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  it "is unique in the database" do
    User.create(name: "Cameron Kid", email: "testingforspecs@gmail.com", password: "test123!", password_confirmation: "test123!").should be_valid
    User.create(name: "Fake Imposter", email: "testingforspecs@gmail.com", password: "test123!", password_confirmation: "test123!").should_not be_valid
  end

  it "can have only one personal detail" do
    FactoryGirl.create(:personal_detail)
  end




end