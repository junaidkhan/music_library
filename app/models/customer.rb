class Customer < ActiveRecord::Base
	has_many :orders
  attr_accessible :created_at, :first_name, :last_name, :updated_at, :zip_code

  validates :first_name, :length => { :minimum => 8 }
  validates :first_name, :length => { :maximum => 20 }
  validates :last_name, :presence => {:message => 'Name cannot be blank, Task not saved'}
end
