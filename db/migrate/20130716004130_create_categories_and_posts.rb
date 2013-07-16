class CreateCategoriesAndPosts < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end

    create_table :posts do |t|
      t.string :title, :token
      t.text :content
      t.belongs_to :category
      t.timestamps
    end
  end
end
