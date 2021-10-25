class HomesController < ApplicationController
  def top
    # @bartered_items = BarteredItem.where(is_deleted: false).last(4).reverse
    @bartered_items = BarteredItem.all
  end

  def about
  end
end
