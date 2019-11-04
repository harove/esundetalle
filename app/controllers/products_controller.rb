class ProductsController < ApplicationController
  authorize_resource

  def index
    @products = Product.all
    @product = Product.new
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def create

    @product = Product.new(product_params)
    
    if params[:product][:images].present?
      params[:product][:images].each do |image|
        @product.images.attach(image)
      end
    end




    # @product.images.attach(params[:images])
    #@product.images = params[:product][:images]







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
      # params.require(:product).permit(:name, :price, :image )
      # params.require(:product).permit(:name, :price, :description, images: [])
      params.require(:product).permit(:name, :price, :description)
    
    
    end


end
