class AddPickToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :pick, :boolean
  end
end
