class AddIssuperadminToAdminUser < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :issuperadmin, :boolean
  end
end
