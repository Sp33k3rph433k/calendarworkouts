require 'spec_helper'

describe InitialTest do
  let(:this_guy) { FactoryGirl.create(:user) }
  let(:initial_test) { this_guy.create_initial_test }

  it { is_expected.to respond_to :user }
  it "should be owned to the user" do
    expect(initial_test.user_id).to equal(this_guy.id)
  end

  it "should be created with 3 exercises" do
    expect(initial_test.exercises.size).to equal(3)
  end

end
