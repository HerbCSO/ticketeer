class AddServicePermissionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :servicer, :boolean, default: false
  end
end
