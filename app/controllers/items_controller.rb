class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    
    if @item.save
      flash[:notice] = "Item saved successfully."
     else
       flash[:alert] = "Item failed to save."
    end
  redirect_to user_path(current_user)
  end
  
  
  
  private
  def item_params
     params.require(:item).permit(:name)
  end
end
