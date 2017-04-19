
ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :issuperadmin

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :issuperadmin
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :issuperadmin
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def action_methods
      if current_admin_user.issuperadmin?
        super
      else
        super - ['destroy', 'new', 'edit']
      end
    end
  end

end
