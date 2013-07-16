class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :posts
  before_save {self.name = name.downcase}
end
