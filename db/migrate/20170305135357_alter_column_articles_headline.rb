class AlterColumnArticlesHeadline < ActiveRecord::Migration[5.0]
  def change
    change_table :articles do |t|
      t.change :headline, :text
    end
  end
end
