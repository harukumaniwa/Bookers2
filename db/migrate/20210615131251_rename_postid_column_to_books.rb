class RenamePostidColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :postid, :user_id
  end
end
