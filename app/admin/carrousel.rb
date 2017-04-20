ActiveAdmin.register Carrousel do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :image1, :image2, :image3, :image4
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
    column "Image 750x350", :image1_file_name
    column "Image 1220x500", :image2_file_name
    column "Image 1520x550", :image3_file_name
    column "Image 1920x624", :image4_file_name    
  actions
end

  form do |f|
    f.inputs "Ajouter une image" do
      f.input :image1, required: true, :label => "Image 750x350"
      f.input :image2, required: true, :label => "Image 1220x500"
      f.input :image3, required: true, :label => "Image 1520x550"
      f.input :image4, required: true, :label => "Image 1920x624"
    end
    f.actions
end

end
