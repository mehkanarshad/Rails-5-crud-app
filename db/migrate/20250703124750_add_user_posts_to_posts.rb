class AddUserPostsToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :user_id, :integer
  end
end
