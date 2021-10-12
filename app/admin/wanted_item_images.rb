ActiveAdmin.register WantedItemImage do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :wanted_item_id, :image_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:wanted_item_id, :image_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :wanted_item_id, :image_id
  
end
