class Order < ActiveRecord::Base
	belongs_to :customer
	has_many :line_items
  attr_accessible :created_at, :invoice_number, :updated_at, :customer_id
end
