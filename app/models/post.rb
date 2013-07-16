class Post < ActiveRecord::Base
  attr_accessible :title, :token, :content, :category_id
  belongs_to :category
  before_create :create_url_token


  private
    def create_url_token
      self.token = SecureRandom.urlsafe_base64(8)
    end
end
