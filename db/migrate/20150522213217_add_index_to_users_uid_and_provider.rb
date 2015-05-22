class AddIndexToUsersUidAndProvider < ActiveRecord::Migration
  def change
    add_index :users, :uid, unique: true
    add_index :users, :provider, unique: true
  end
end
