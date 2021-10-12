ActiveAdmin.register BarteredItem do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :title, :explanation, :barter_way, :desired_place, :no1_wanted_item_id, :no2_wanted_item_id, :no3_wanted_item_id, :barter_status, :is_deleted
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :title, :explanation, :barter_way, :desired_place, :no1_wanted_item_id, :no2_wanted_item_id, :no3_wanted_item_id, :barter_status, :is_deleted]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :user_id, :title, :explanation, :barter_way, :desired_place, :no1_wanted_item_id, :no2_wanted_item_id, :no3_wanted_item_id, :barter_status, :is_deleted
  
  
end
