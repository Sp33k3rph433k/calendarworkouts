require 'spec_helper'

describe PersonalDetail do
  let(:user) {FactoryGirl.create(:user)}
  before {@personal_detail = user.build_personal_detail(weight: "150")}

  subject {@personal_detail}

  it { should respond_to(:user_id)}
  it { should respond_to(:user)}
  it {should respond_to(:weight)}

  describe "#new" do
    it "asks for a persons measurements"


  end

  describe "#save" do
    it "saves new personal attributes to the database"

    it "only updates the attributes that are passed"


  end
end
