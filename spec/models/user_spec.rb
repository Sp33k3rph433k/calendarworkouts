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

  it "is able to update its own personal detail" do
    FactoryGirl.create(:personal_detail)

  end



  describe "#dashboard" do

    it "displays a users personal details if there are any"

    it "displays a link to the personal detail form if there aren't any"

    context "User has completed initial workout test" do
      it "shows workouts for the current calendar week"
    end

    it "should link to a workout form"
  end

  describe "#view_profile" do

    it "can upload a progress picture" do

    end

  end


end