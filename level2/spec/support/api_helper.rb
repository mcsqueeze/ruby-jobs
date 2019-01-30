# command line: rspec ./spec/support/api_helper.rb

require 'rails_helper.rb'

RSpec.describe Api::CommunicationsController, :type => :controller do

  describe "GET api/communications#index" do  #tests for 1st endpoint
    before do
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end
  end
end
