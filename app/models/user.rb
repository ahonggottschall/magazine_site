class User < ActiveRecord::Base

  validates_uniqueness_of :email, :case_sensitive => false
  has_many :articles

end
