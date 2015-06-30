class AddMoreInfoLinkToTidbits < ActiveRecord::Migration
  def change
    add_column :tidbits, :more_info_link, :string
  end
end
