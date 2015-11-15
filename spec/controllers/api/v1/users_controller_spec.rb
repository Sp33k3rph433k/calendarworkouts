require 'rails_helper'
require 'pry'

describe Api::V1::UsersController, :type => :controller do
  before(:each) { request.headers['Accept'] = "application/vnd.calendarworkouts.v1" }

  describe "GET #dashboard" do
    before(:each) do
      @user = FactoryGirl.create :user
      get :dashboard, user_id: @user.id, format: :json
    end

    it "returns the information about the user on a hash" do
      binding.pry
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:user][:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do
    before(:each) do
      user_attributes = FactoryGirl.attributes_for :user
      post :create, { user: user_attributes }, format: :json
    end
    context "when successfully created" do
      it "should respond with 201 when successfully created" do
        expect(response.status).to eq(201)
      end
    end
  end
end
