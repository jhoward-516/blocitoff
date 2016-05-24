class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @item.expire_at = Time.now + 7.days
    
    if @item.save
      flash[:notice] = "Item saved successfully."
     else
       flash[:alert] = "Item failed to save."
    end
  redirect_to user_path(current_user)
  end
  
  def toggle
    @item = Item.find(params[:item_id])
    @item.complete = !@item.complete
    @item.save

    redirect_to current_user
  end
  
  def destroy
    @item = Item.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was deleted successfully."
     else
       flash.now[:alert] = "There was an error deleting the item."
    end
    
    redirect_to current_user
  end
  
  private
  def item_params
     params.require(:item).permit(:name)
  end
end
