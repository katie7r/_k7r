class ChangeTidbitMoreInfoToText < ActiveRecord::Migration
  def change
    change_column :tidbits, :more_info, :text
  end
end
