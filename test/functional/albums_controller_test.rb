require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  setup do
    @album = albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:albums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album" do
    assert_difference('Album.count') do
      post :create, album: { artist_id: @album.artist_id, created_at: @album.created_at, feature: @album.feature, genre: @album.genre, image_path: @album.image_path, release_date: @album.release_date, title: @album.title, updated_at: @album.updated_at }
    end

    assert_redirected_to album_path(assigns(:album))
  end

  test "should show album" do
    get :show, id: @album
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album
    assert_response :success
  end

  test "should update album" do
    put :update, id: @album, album: { artist_id: @album.artist_id, created_at: @album.created_at, feature: @album.feature, genre: @album.genre, image_path: @album.image_path, release_date: @album.release_date, title: @album.title, updated_at: @album.updated_at }
    assert_redirected_to album_path(assigns(:album))
  end

  test "should destroy album" do
    assert_difference('Album.count', -1) do
      delete :destroy, id: @album
    end

    assert_redirected_to albums_path
  end
end
