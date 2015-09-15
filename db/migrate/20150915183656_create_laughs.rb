class CreateLaughs < ActiveRecord::Migration
  def change
    create_table :laughs do |t|
      t.text    :setup,       default: ''
      t.text    :content,     null:    false
      t.text    :followup,    default: ''
      t.string  :source_link, default: ''
      t.boolean :published,   default: false

      t.timestamps null: false
    end
  end
end
