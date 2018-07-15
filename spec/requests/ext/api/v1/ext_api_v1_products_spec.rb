require 'rails_helper'

RSpec.describe "Ext::Api::V1::Products", type: :request do
  let!(:products) { create_list(:ext_api_v1_product, 10) }
  let(:product_pid) { products.first.pid }

  describe "GET /ext_api_v1_products" do
    before { get ext_api_v1_products_path }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns products' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end

  describe "GET /ext_api_v1_products/:id" do
    context 'when the product id exists' do
      before { get "/ext/api/v1/products/#{product_pid}" }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the product' do
        expect(json).not_to be_empty
        expect(json['pid']).to eq(product_pid)
      end
    end

    context 'when the prodict id does not exist' do
      before { get "/ext/api/v1/products/100" }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Document not found/)
      end
    end
  end
end
