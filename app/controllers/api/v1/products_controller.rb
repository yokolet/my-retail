class Api::V1::ProductsController < ApplicationController
  before_action :set_api_v1_products, only: [:index]
  before_action :set_api_v1_product, only: [:show, :update]

  # GET /products
  def index
    render json: @products_info, status: @response_code
  end

  # GET /products/1
  def show
    render json: @product_info, status: @response_code
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

    def format_products(products)
      products.reduce([]) do |memo, p|
        memo << {id: p["pid"], name: p["name"]}
      end
    end

    def set_api_v1_products
      response = RestClient.get(API_ENDPOINT, {accept: :json})
      @products_info = format_products(JSON.parse(response.body))
      @response_code = response.code
    end

    def format_product(product, current_price)
      {id: product["pid"],
       name: product["name"],
       current_price: {value: current_price["value"],
                       currency_code: current_price["currency_code"]}}
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_product
      response = RestClient.get(API_ENDPOINT + "/" + params[:id])
      product = JSON.parse(response.body)
      current_price = Api::V1::CurrentPrice.find_by({pid: product["pid"]})
      @product_info = format_product(product, current_price)
      @response_code = response.code
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_product_params
      params.require(:api_v1_product).permit(:pid, :name)
    end
end
