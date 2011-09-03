class OrdersController < ApplicationController
  filter_access_to :index, :show, :archive
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.find(:all, :conditions=>{:archive => 0})
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # Move order to archive
  def add_to_archive
    @order = Order.find(params[:id])
    @order.archive = 1
    if @order.save
    redirect_to :orders
    flash[:notice] = 'Товар успешно перемещен в архив.'
    end
  end
  
  def archive
    @orders = Order.find(:all, :conditions=>{:archive => 1}, :order=>:created_at desc)
    render :layout => 'archive'
  end

end
