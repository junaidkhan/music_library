class Feature < ActiveRecord::Base
  has_and_belongs_to_many :albums
  attr_accessible :name
end
