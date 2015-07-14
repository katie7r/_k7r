class AddUsernameToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :username, :string, null: false

    remove_index :admins, column: :email
    add_index :admins, :email
    add_index :admins, :username, unique: true
  end
end
