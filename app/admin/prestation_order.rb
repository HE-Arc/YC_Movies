ActiveAdmin.register PrestationOrder do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :firstname, :entreprise, :tel, :availabilities, :typeofproduct, :product, :length, :other
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
    column :firstname
    column :entreprise
    column "Phone number", :tel
    column :availabilities
    column "Type of product", :typeofproduct
    column :product
    column "Video length" do |v|
    	v.length.strftime('%M:%S')
    end
    column :other
    column :created_at
  actions
end

show do |p| 
    attributes_table do
	row :name
    row :firstname
    row :entreprise
    row "Phone number" do
    	p.tel
    end
    row :availabilities
    row "Type of product" do
    	p.typeofproduct
    end
    row :product
    row "Video length" do
    	p.length.strftime('%M:%S')
    end
    row :other
    row :created_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Ajouter une image" do
      f.input :name
      f.input :firstname, required: true
      f.input :entreprise, required: true
      f.input :tel, required: true, :label => "Phone number"
      f.input :availabilities, required: true
      f.input :typeofproduct, required: true, :label => "Type of product"
      f.input :product, required: true
      f.input :length, required: true, :label => "Video length"
      f.input :other
     end
      f.actions
  end
end
