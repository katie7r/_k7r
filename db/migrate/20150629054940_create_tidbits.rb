class CreateTidbits < ActiveRecord::Migration
  def change
    create_table :tidbits do |t|
      t.string :type, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.string :more_info
      t.integer :author_id

      t.timestamps
    end
  end
end
