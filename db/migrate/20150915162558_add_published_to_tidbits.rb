class AddPublishedToTidbits < ActiveRecord::Migration
  def change
    add_column :tidbits, :published, :boolean, default: false
  end
end
