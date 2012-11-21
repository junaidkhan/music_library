class Artist < ActiveRecord::Base
  has_many :albums
  attr_accessible :active_years, :biography, :created_at, :name, :updated_at
end
