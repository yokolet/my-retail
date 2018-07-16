require 'rails_helper'

RSpec.describe "Api::V1::Products", type: :request do
  # The API makes HTTP requests to get product info
  # 10 products were already seeded
  before { create_current_prices }
  let(:product_pid) { 53160687 }

  describe "GET /api_v1_products" do
    before { get api_v1_products_path }

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end

    it 'returns products' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end

  describe "GET /api_v1_products/:id" do
    context 'when the product id exists' do
      before { get "/api/v1/products/#{product_pid}" }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the product' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(product_pid)
      end

      it 'returns the current price of the product' do
        expect(json).not_to be_empty
        expect(json['current_price']).not_to be_empty
      end
    end

    context 'when the prodict id does not exist' do
      before { get "/api/v1/products/100" }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Not Found/)
      end
    end
  end
end
