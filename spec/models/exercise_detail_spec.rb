require 'rails_helper'

RSpec.describe ExerciseDetail, type: :model do
  let(:detail) {FactoryGirl.create :exercise_detail}

  it { is_expected.to respond_to :user }
  it { is_expected.to respond_to :exercise }
  it { is_expected.to respond_to :workout }
  it { is_expected.to respond_to :initial_test }

end
