class ChangeTidbitsAuthorIdToAdminId < ActiveRecord::Migration
  def change
    rename_column :tidbits, :author_id, :admin_id
  end
end
