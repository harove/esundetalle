ActiveAdmin.register Product do
    permit_params :name, :image
    form partial: 'form'
  
    show do
      attributes_table do
        row :name
        row :image do |ad|
          image_tag url_for(ad.image.variant(resize: '200x200'))
        end
      end
    end
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

end
