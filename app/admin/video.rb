ActiveAdmin.register Photosvideo, as: 'Videos' do
#actions :all, :except => [:edit]
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :category_id, videos_attributes: [:name, :mylink, :uid, :_destroy, :id]
  index do |p| 
	selectable_column
    column :category
    column "Videos", :videos do |p|
  	  table_for p.videos.order('created_at DESC') do
  		column do |c|
  			link_to "https://www.youtube.com/watch?v="+c.uid, "https://www.youtube.com/watch?v="+c.uid
  		end
      end
    end
  actions
end

show do |p| 
  attributes_table do
    row :category
    panel "Videos" do
      table_for p.videos do
        column do |c|
           link_to "https://www.youtube.com/watch?v="+c.uid, "https://www.youtube.com/watch?v="+c.uid
        end     
      end
    end
  end
  active_admin_comments
end

form do |f|
  f.inputs "Ajouter une vidéo" do
    f.input :category
    f.semantic_errors :error
    f.has_many :videos, heading: 'Videos',new_record: "Add new video", allow_destroy: true do |g|
      if f.object.new_record?
        g.input :uid, :label => "URL de la vidéo youtube : ",  :type => :text, :input_html => { :value => ""}
      else
        if g.object.id
          g.input :uid, :label => "URL de la vidéo youtube : ",  :type => :text, :input_html => { :value => "https://www.youtube.com/watch?v="+Galery.find(g.object.id).uid}
        else
          g.input :uid, :label => "URL de la vidéo youtube : ",  :type => :text
        end
      end
	 end
	 action :submit, :label => "Save"
  end
end

before_build do |record|
  record.type_id = Type.where(:name => 'Video').first.id
end

controller do |p|
  def scoped_collection
    Type.where(:name => 'Video').first.photosvideos.order('created_at DESC')
  end
end
end