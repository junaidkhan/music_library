class Admin2Controller < ApplicationController
	
before_filter :authorize_access, :except => [:login, :send_login]
	def menue
		
	end

	def login
		@user = User.new
		
	end

	def send_login
		@user = User.new(params[:user])
		logged_in_user = @user.try_to_login
		if logged_in_user
			session[:user_id] = logged_in_user.id
			flash[:notice] = "You are now logged in"
			redirect_to(:action => 'menue')
		else
			flash[:notice] = "username or password is incorrect"
			redirect_to(:action => 'login')
		end

	end

	def log_out
		session[:user_id] = nil
		flash[:notice] = "you are now logged out"
		redirect_to(:action => "login")
		
	end


	

end
