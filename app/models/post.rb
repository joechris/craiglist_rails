class Post < ActiveRecord::Base
  attr_accessible :title, :token, :content
  belongs_to :category
end
