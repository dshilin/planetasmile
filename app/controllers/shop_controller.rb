class ShopController < ApplicationController
  def index
    @today = Today.find_by_actual_date(Date.today)
    if @today == nil
       redirect_to :action=>:full
    else
      @products = Product.actual
    end
  end

  def full
  @products = Product.paginate :page => params[:page], :order => 'category_id, name'
    render :layout => 'prod'
  end

def products_by_category
  @category = Category.find(params[:id])
  @products = Product.paginate :page => params[:page], :conditions=>{:category_id => params[:id]}, :order => 'category_id, name'
  render :layout => 'prod'
end

def checkout
if !logged_in?
  redirect_to :controller => :sessions, :action => 'new'
else
  render :layout => 'application'
end
end

def save_order
@order = Order.new(params[:order])
@order.add_line_items_from_cart(@cart)
if @order.save
  require 'soap/wsdlDriver'
  require 'pp'


    def explain_problem(response)
      pp " code    : "+response['code'].to_s
      pp " message : "+response['message'].to_s
      pp response['extend']
      if (response['extend'] && response['extend'].kind_of?(Array))
           p response['extend']
      end
    end

  wsdl = "http://vipsms.net/api/soap.html"

  driver = SOAP::WSDLDriverFactory.new(wsdl).create_rpc_driver
  login  = 'vasd85'
  passwd = 'kryshynet'

  response = driver.getVersion();

  begin
      response = driver.auth(login, passwd)
      if response['code']!=0 then raise "Auth failed" end
  rescue Exception => ex
  end

  sessid = response['message'];

  begin
      response = driver.sendSmsOne(sessid, "+79272253615", 'planeta', "#{@order.contact_name}, #{@order.contact_phone}, #{@order.adress}");
      if response['code']!=0 then raise "Message not sended" else raise "Message successfull send" end
  rescue Exception => ex
      logger.error("#{ex.message}" )
      logger.error("#{explain_problem response}")
  end
  session[:cart] = nil
  redirect_to_index("Спасибо за ваш заказ! Через некоторое время с Вами свяжется курьер." )
else
render :action => :checkout
end
end


  def add_to_cart
    begin
      product = Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}" )
      redirect_to_index("Неправильный продукт")
    else
    @current_item = @cart.add_product(product)
    if request.xhr?
      respond_to { |format| format.js }
    else
      redirect_to_index
    end
    end
  end
  
  def show_cart
    render(:partial => "show_cart" , :object => @cart, :layout=>"shop")
  end
  
  def empty_cart
    session[:cart] = nil
    redirect_to_index
  end

end