class MobItemsController < InheritedResources::Base

  def index
    @q = MobItem.ransack(params[:q])
    @q.sorts = 'mob_name asc' if @q.sorts.empty?
    
    @mob_items = @q.result
    @mob_items = @mob_items.page(params[:page])

    render layout: 'dialog' if params[:mode] == 'dialog'
  end


  private

    def mob_item_params
      params.require(:mob_item).permit(:mob_id, :item_id)
    end
end

