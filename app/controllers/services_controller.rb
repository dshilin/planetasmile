class ServicesController < ApplicationController
  filter_access_to :new, :edit, :destroy, :update, :create
  # GET /services
  # GET /services.xml
  def index
    @services = Service.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @services }
    end
  end

  # GET /services/new
  # GET /services/new.xml
  def new
    @service = Service.new
@categories = Category.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service }
    end
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
    @categories = Category.find(:all)
  end

  # POST /services
  # POST /services.xml
  def create
    @service = Service.new(params[:service])
@categories = Category.find(:all)
    respond_to do |format|
      if @service.save
        flash[:notice] = 'Тектс успешно добавлен.'
        format.html { redirect_to(services_path) }
        format.xml  { render :xml => @service, :status => :created, :location => @service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.xml
  def update
    @service = Service.find(params[:id])
    respond_to do |format|
      if @service.update_attributes(params[:service])
        flash[:notice] = 'Текст отредактирован.'
        format.html { redirect_to(services_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.xml
  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    respond_to do |format|
      format.html { redirect_to(services_url) }
      format.xml  { head :ok }
    end
  end
end
