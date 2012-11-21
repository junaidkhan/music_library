class ApplicationController < ActionController::Base
  protect_from_forgery
Rails.env = ActiveSupport::StringInquirer.new('production')
 private #--------------

def authorize_access
	if not session[:user_id]
		flash[:notice] = "please log in"
		redirect_to(:controller => 'admin2', :action => "login")
		return false
	end
	
end
end
