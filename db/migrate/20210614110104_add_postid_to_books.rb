class AddPostidToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :postid, :integer
  end
end
