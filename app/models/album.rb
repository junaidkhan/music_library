class Album < ActiveRecord::Base
	belongs_to :artist
	has_and_belongs_to_many :features
	has_many :line_items
  attr_accessible :artist_id, :created_at, :genre, :image_path, :release_date, :title, :updated_at, :price
end
