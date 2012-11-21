class PublicController < ApplicationController

	before_filter :find_or_create_cart #, :only => [:add_to_cart, :show_cart, :empty_cart]
	def list
		@albums = Album.all

	end
	
	def add_to_cart
		album = Album.find(params[:id])
		#@cart = find_or_create_cart     #with before_filter we dont need this line
		@cart.add_album(album)
		redirect_to(:action => 'show_cart')
		
	end

	def show_cart
		#@cart = find_or_create_cart
	end

	def empty_cart
		@cart.empty_all
		flash[:notice] = "the cart was emptyied sucessfuly"
		redirect_to(:action => 'list')
		
	end

	def remove_item
		album = Album.find(params[:id])
		@cart.remove_album(album)
		flash[:notice] = "Item was sucessfully removed"
		redirect_to(:action => 'show_cart')
		
	end

	def check_out
		@customer = Customer.new
		
	end

	def save_order
	
		@customer = Customer.new(params[:customer])
		credit_no = params[:credit_card]
		@order = Order.new
		@order.line_items << @cart.items
		@customer.orders << @order
		if @customer.save
			#payment processing and redirect_to('show_reciept')
		else
			flash[:notice] = "there were some errors in your data"
			redirect_to(:action => 'check_out')
		end
	end

	private #.....................

	def find_or_create_cart
		@cart = session[:cart] ||= Cart.new
		
	end
end
