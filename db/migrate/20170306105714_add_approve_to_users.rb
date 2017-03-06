class AddApproveToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :approve, :boolean
  end
end
