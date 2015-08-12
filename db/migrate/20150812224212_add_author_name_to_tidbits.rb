class AddAuthorNameToTidbits < ActiveRecord::Migration
  def change
    add_column :tidbits, :author_name, :string, default: ''
  end
end
