ActiveAdmin.register Captcha do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :activate
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

 index do |p| 
    column "Activate", :activate 
  actions
end

 show do |p| 
    attributes_table do
      row "Activate" do
    	p.activate
      end
    end
  active_admin_comments
  end

  form do |f|
    f.inputs "Activer/Désactiver le captcha" do
      f.input :activate, :label => "Activate"
    end
  f.actions
  end

  controller do
    def action_methods
        super - ['destroy', 'new', ]
     end
  end

end
