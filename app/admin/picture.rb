ActiveAdmin.register Photosvideo, as: 'Picture' do

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
  permit_params :type_id, :category_id, pictures_attributes: [:id,:name, :_destroy, :image]
  index do |p| 
	selectable_column
    column :category
    column :pictures do |p|
  	  table_for p.pictures.order('created_at DESC') do
  		column do |c|
  			c.image_file_name
  		end
      end
    end
  actions
end

show do |p| 
  attributes_table do
    row :category
    panel "Pictures" do
      table_for p.pictures do
        column do |c|
          c.image_file_name
        end     
      end
    end
  end
  active_admin_comments
end


  form multipart: true do |f|
    f.inputs "Ajouter une image" do
      f.input :category
      f.semantic_errors :error
        f.has_many :pictures, allow_destroy: true do |f|
        f.input :image, required: false
	    end
         action :submit, :label => "Save"
    end
 end


   before_build do |record|
    record.type_id = Type.where(:name => 'Picture').first.id
  end

   controller do |p|
    def scoped_collection
   Type.where(:name => 'Picture').first.photosvideos.order('created_at DESC')
  end

end
end