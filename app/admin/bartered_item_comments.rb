ActiveAdmin.register BarteredItemComment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :bartered_item_id, :user_id, :comment
  #
  # or
  #
  # permit_params do
  #   permitted = [:bartered_item_id, :user_id, :comment]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :bartered_item_id, :user_id, :comment
  
end
