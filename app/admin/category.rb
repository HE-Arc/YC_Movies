ActiveAdmin.register Category do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :name, :image1, :image2, :image3, :image4
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do |p| 
	selectable_column
	column :name
    column "Image 736x200", :image1_file_name
    column "Image 640x220", :image2_file_name
    column "Image 288x200", :image3_file_name
    column "Image 992x200", :image4_file_name
  actions
end

  form do |f|
    f.inputs "Ajouter une image" do
      f.input :name
      f.input :image1, required: true, :label => "Image 736x200"
      f.input :image2, required: true, :label => "Image 640x220"
      f.input :image3, required: true, :label => "Image 288x200"
      f.input :image4, required: true, :label => "Image 992x200"
    end
    f.actions
end

end
