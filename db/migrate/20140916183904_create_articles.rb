class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :content
      t.string :category

      t.timestamps
    end
  end
end
