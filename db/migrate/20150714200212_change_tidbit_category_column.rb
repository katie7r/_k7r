class ChangeTidbitCategoryColumn < ActiveRecord::Migration
  def change
    remove_column :tidbits, :tidbit_type
    add_column :tidbits, :category, :integer, default: 0, null: false
  end
end
