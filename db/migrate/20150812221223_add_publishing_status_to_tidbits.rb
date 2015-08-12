class AddPublishingStatusToTidbits < ActiveRecord::Migration
  def change
    add_column :tidbits, :published, :boolean, default: false
    add_column :tidbits, :published_at, :timestamp
  end
end
