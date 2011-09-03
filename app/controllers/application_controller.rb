# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :find_categories
  before_filter :find_user_cart
  helper :all # include all helpers, all the time
  include AuthenticatedSystem
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => 'd3e42d415c50e4fcd158a300b0146ebf'

  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
 def permission_denied  
   flash[:error] = "Извините, у вас нет доступа к этой странице."  
   redirect_to ('/')
 end
 
 private
 
 def find_categories
   @categories = Category.find(:all)
 end

 def find_user_cart
   @cart = find_cart
 end
 
  def find_cart
    session[:cart] ||= Cart.new
  end
  
  def redirect_to_index(msg=nil)
    flash[:notice] = msg
    redirect_to :action => :index
  end
end
