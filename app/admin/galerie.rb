ActiveAdmin.register Galerie do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :mylink
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


 form do |f|
   f.inputs do
     f.input :mylink, :label => "URL de la vidéo youtube : ",  :type => :text
   end
   f.actions
  end

end
