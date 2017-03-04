class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :author
      t.string :title
      t.string :headline
      t.date :published
      t.text :content
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
