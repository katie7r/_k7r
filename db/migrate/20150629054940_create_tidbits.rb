class CreateTidbits < ActiveRecord::Migration
  def change
    create_table :tidbits do |t|
      t.string :tidbit_type, null: false
      t.string :title,       null: false
      t.text :content,       null: false
      t.string :more_info
      t.string :more_info_link
      t.integer :author_id

      t.timestamps
    end
  end
end
