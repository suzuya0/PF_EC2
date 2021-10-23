class HomesController < ApplicationController
  def top
    @bartered_items = BarteredItem.where(is_deleted: false).last(4).reverse
  end

  def about
  end
end
