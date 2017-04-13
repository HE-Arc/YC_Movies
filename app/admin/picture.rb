ActiveAdmin.register Picture do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :image, :category_id
  index do
	selectable_column
	column  :image_file_name
	column :created_at
	column :image_file_size
    column :category
    actions defaults: true
  end  

  form multipart: true do |f|
    f.inputs "Ajouter une image" do
      f.input :image, required: false
      f.input :category
    end
    f.actions
end

end
