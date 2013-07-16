class Post < ActiveRecord::Base
  attr_accessible :title, :token, :content, :category_id
  belongs_to :category
end
