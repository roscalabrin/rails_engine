require 'rails_helper'

RSpec.describe Api::V1::Items::RandomController, :type => :request do

  describe "GET #show" do
    it "returns a response for a random item" do
      items = create_list(:item, 3)

      get '/api/v1/items/random'
      expect(response).to be_success

      content = JSON.parse(response.body)
      expect(content.keys).to eq(["id", "name", "description", "unit_price", "merchant_id", "created_at", "updated_at"])
    end
  end
end
