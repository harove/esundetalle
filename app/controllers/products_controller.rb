class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product = Product.new
  end


  def create
    
    @product = Product.new(product_params)
    
    @product.image.attach(params[:product][:image])

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :image )
    end


end