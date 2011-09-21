class ProductsController < ApplicationController
  filter_access_to :index, :new, :edit, :destroy, :update, :create
  # GET /products
  # GET /products.xml
  def index
    @products = Product.find(:all)
    @categories ||= []
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])
    render :layout => 'show'
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
    @categories ||= [] 
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @categories ||= [] 
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])
    @categories ||= []
    respond_to do |format|
     if @product.save
        flash[:notice] = 'Товар успешно добавлен.'
        format.html { redirect_to(@product) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Товар успешно отредактирован.'
        format.html { redirect_to(products_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
  def since
    if params[:product] && !params[:product].empty?
      @categories= Category.find(:all,:conditions=>"customer_id=#{params[:product]}")
    else
      @categories=[]
    end
    respond_to do |format|
      format.html { redirect_to :action => 'new' }
      format.js { render :partial => 'categories', :object => @categories }
    end
  end  
end
