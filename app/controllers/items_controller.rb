class ItemsController < InheritedResources::Base

  def index
    @q = Item.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    
    @items = @q.result
    @items = @items.page(params[:page])

    render layout: 'dialog' if params[:mode] == 'dialog'
  end

  def show
    @item = Item.find_by(name: params[:name])
    
    if @item.nil?
      redirect_to items_path(q: {name_cont: params[:name]}), flash: {warning: I18n.t('msg.not_found')}
    end
  end

  private

    def item_params
      params.require(:item).permit(:item_kind_id, :name, :image)
    end
end

