class CustomersController < ApplicationController
  filter_access_to :new, :edit, :destroy, :update, :create
  # GET /customers
  # GET /customers.xml
  def index
    @customers = Customer.all
    render :layout => 'prod'
  end

  # GET /customers/1
  # GET /customers/1.xml
  def show
    @customer = Customer.find(params[:id])
    @categories = @customer.categories.find(:all)
    render :layout => 'prod'
  end

  # GET /customers/new
  # GET /customers/new.xml
  def new
    @customer = Customer.new
    @categories = Category.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
    @categories=Category.find(:all)
  end

  # POST /customers
  # POST /customers.xml
  def create
    @customer =Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        
        format.html { redirect_to(@customer, :notice => 'Customer was successfully created.') }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        flash[:notice] = 'Продавец успешно отредактирован.'
        format.html { redirect_to(customers_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.xml
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to(customers_url) }
      format.xml  { head :ok }
    end
  end
end
