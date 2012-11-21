require "digest/sha1"

class User < ActiveRecord::Base
	
  attr_accessor :password
  attr_accessible :name, :password

  validates :name, :password, :presence => {:message => "require"}
  validates :name, :uniqueness => {:message => "unique"}

   before_create :hash_password
  	#self.hashed_password  = User.hashed_password(self.password)
  	
  	after_create :rem_pas
  

  def rem_pas
  	@password = nil
  	
  end

  def self.login(name, password)
    hashed_password = User.hash_password2(password || "")
    self.find(:first, :conditions => ["name = ? AND hashed_password = ?", name, hashed_password])
    
  end

  def try_to_login
    User.login(self.name, self.password)
    
  end

  private #---------------------

  def hash_password
  	self.hashed_password = Digest::SHA1.hexdigest(self.password)
  	
  end

  def self.hash_password2(password)
    return Digest::SHA1.hexdigest(password)
    
  end
end
