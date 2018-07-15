class Api::V1::ProductsController < ApplicationController
  before_action :set_api_v1_product, only: [:show, :update]

  # GET /products
  def index
    response = request_external_api
    render json: response.body, status: response.code
  end

  # GET /products/1
  def show
    response = set_api_v1_product
    render json: response.body, status: response.code
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private
    API_ENDPOINT = "http://localhost:3000/ext/api/v1/products"

    def request_external_api
      RestClient.get(API_ENDPOINT, {accept: :json})
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_product
      RestClient.get(API_ENDPOINT + "/" + params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_product_params
      params.require(:api_v1_product).permit(:pid, :name)
    end
end
