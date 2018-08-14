class ItemKindsController < InheritedResources::Base

  def index
    @q = ItemKind.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    
    @item_kinds = @q.result
    @item_kinds = @item_kinds.page(params[:page])

    render layout: 'dialog' if params[:mode] == 'dialog'
  end

  private

    def item_kind_params
      params.require(:item_kind).permit(:name)
    end
end

