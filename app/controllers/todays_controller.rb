class TodaysController < ApplicationController
  filter_access_to :index, :show, :new, :edit, :destroy, :update, :create
  # GET /todays
  # GET /todays.xml
  def index
    @today = Today.find(:all, :order=> 'id desc')
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @todays }
    end
  end

  # GET /todays/1
  # GET /todays/1.xml
  def show
    @today = Today.find(params[:id])
    @products = Product.find((@today.product_ids.gsub(/\d+/)).collect)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @today }
    end
  end

  # GET /todays/new
  # GET /todays/new.xml
  def new
    @today = Today.new
    @products = Product.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @today }
    end
  end

  # GET /todays/1/edit
  def edit
    @today = Today.find(params[:id])
    @products = Product.find(:all)
  end

  # POST /todays
  # POST /todays.xml
  def create
    @products = Product.find(:all)
    @today = Today.new(params[:today])
    @today.product_ids = params['product_ids']
    respond_to do |format|
      if @today.save
        flash[:notice] = 'Меню успешно создано.'
        format.html { redirect_to(todays_path) }
        format.xml  { render :xml => @today, :status => :created, :location => @today }
      else
        flash[:notice] = 'Невозможно создать меню.'
        format.html { render :action => "new" }
        format.xml  { render :xml => @today.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /todays/1
  # PUT /todays/1.xml
  def update
    @today = Today.find(params[:id])

    @today.product_ids = params['product_ids']
    respond_to do |format|
      if @today.update_attributes(params[:today])
        flash[:notice] = 'Меню изменено.'
        format.html { redirect_to(@today) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @today.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /todays/1
  # DELETE /todays/1.xml
  def destroy
    @today = Today.find(params[:id])
    @today.destroy

    respond_to do |format|
      format.html { redirect_to(todays_url) }
      format.xml  { head :ok }
    end
  end
end
