class AdminController < ApplicationController
	
	#the following are the different forms of find method though which we
	#can find or search any data available in the database
	def index
		@albums = Album.find_by_sql("SELECT * FROM albums")
	
	end
	
	def allrows
		@albums = Album.find(:all)
		render(:action => 'index')
		
	end

	def all_cond
		#if we wana perform the same action with  sql the we have th do the following
		#@albums = Album.find_by_sql("SELECT * FROM albums where release_date >= '2012-10-17'")
		@albums = Album.find(:all, :conditions => "release_date >= '2012-10-17'")
		render(:action => 'index')
		
	end

	def find_cond
		# we use [] so the the active record can clean out data and stop sql injections
		release_date = '2012-10-17';
		artist = 'junaid'
		@albums = Album.find(:all, 
			:conditions => ["release_date >= ? AND artist_old LIKE ?", release_date, '%' + artist + '%'],
			:order => 'title, release_date ASC') #we can also use :limit => number and :offset => number
		render(:action => 'index')
		
	end

	def show
		@albums = Album.find_by_id(params['id'])
		render(:action => 'show')
		
	end

	def new
		#@album = Album.new
		#@album.title = "junaid"
	end

	def create
		@albums = Album.new(params[:album])
		if @albums.save
			redirect_to(:action => 'index')
		end
	end

	def edit
		@album = Album.find_by_id(params[:id])
		
	end

	def update
		@albums = Album.find_by_id(params[:id])
		if @albums.update_attributes(params[:album])
			redirect_to(:action => 'index')
		end
		
	end

	def delete
		@albums = Album.find_by_id(params[:id])
		if @albums.destroy
			redirect_to(:action => 'index')
		end
		
	end
	

end
