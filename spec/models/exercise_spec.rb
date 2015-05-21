require 'spec_helper'

describe Exercise do
  pending "add some examples to (or delete) #{__FILE__}"
  let(:exercise) {FactoryGirl.create(:exercise)}

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :youtube_url }
  it { is_expected.to respond_to :proper_form_text}
  it { is_expected.to respond_to :mini_image_url }
  it { is_expected.to respond_to :is_run? }

end
