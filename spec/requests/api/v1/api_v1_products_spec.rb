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

  describe 'PUT /api_v1_products/:id' do
    let(:valid_attributes) { {value: 73.50} }

    context 'when the record exists' do
      before { put "/api/v1/products/#{product_pid}", params: valid_attributes }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the record' do
        expect(response.body).to be_empty
      end
    end

    context 'when another record exists with two params' do
      let(:product_pid2) { 61052544 }
      let(:valid_attributes2) { {value: 4500, currency_code: "JPY"} }

      before { put "/api/v1/products/#{product_pid2}", params: valid_attributes2 }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the record' do
        expect(response.body).to be_empty
      end
    end

    context 'when the record exists with invalid params' do
      let(:product_pid2) { 61052544 }
      let(:invalid_attribute) { {pid: 100} }

      before { put "/api/v1/products/#{product_pid2}", params: invalid_attribute }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the record' do
        expect(response.body).to be_empty
      end
    end
  end
end
