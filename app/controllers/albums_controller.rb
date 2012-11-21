class AlbumsController < ApplicationController
 before_filter :authorize_access 

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @artists = Artist.all
     @features = Feature.all
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @artists = Artist.all
    @features = Feature.all
    @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.json
  def create

    @album = Album.new(params[:album])
    @features = Feature.all
    checked_features = add_checkbox_items(params[:feature_list])
    remove_checkbox_items(@features, checked_features)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = Album.find(params[:id])
    @features = Feature.all
    
    checked_features = add_checkbox_items(params[:feature_list])
    remove_checkbox_items(@features, checked_features)
    
     

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end


private #..........................

def add_checkbox_items( feature_list_array )
  checked_features = []
    checked_params =  feature_list_array || []
    for check_box_id in checked_params
      feature = Feature.find(check_box_id)
      if not @album.features.include?(feature)
        @album.features << feature
      end
      checked_features << feature
    end
    return checked_features
end

def remove_checkbox_items( features, checked_features)
  missing_fratures = features - checked_features

    for fur in missing_fratures
      if @album.features.include?(fur)
        @album.features.delete(fur)
      end
    end
end

end
