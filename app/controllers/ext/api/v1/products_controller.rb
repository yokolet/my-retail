class Ext::Api::V1::ProductsController < ApplicationController
  before_action :set_ext_api_v1_product, only: [:show, :update, :destroy]

  # GET /ext/api/v1/products
  def index
    @ext_api_v1_products = Ext::Api::V1::Product.all

    render json: @ext_api_v1_products
  end

  # GET /ext/api/v1/products/1
  def show
    render json: @ext_api_v1_product
  end

  # POST /ext/api/v1/products
  def create
    @ext_api_v1_product = Ext::Api::V1::Product.new(ext_api_v1_product_params)

    if @ext_api_v1_product.save
      render json: @ext_api_v1_product, status: :created, location: @ext_api_v1_product
    else
      render json: @ext_api_v1_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ext/api/v1/products/1
  def update
    if @ext_api_v1_product.update(ext_api_v1_product_params)
      render json: @ext_api_v1_product
    else
      render json: @ext_api_v1_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ext/api/v1/products/1
  def destroy
    @ext_api_v1_product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ext_api_v1_product
      @ext_api_v1_product = Ext::Api::V1::Product.find_by({pid: params[:id]})
    end

    # Only allow a trusted parameter "white list" through.
    def ext_api_v1_product_params
      params.require(:ext_api_v1_product).permit(:pid, :name)
    end
end
