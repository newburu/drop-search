class ItemsController < InheritedResources::Base

  def index
    @q = Item.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    
    @items = @q.result
    @items = @items.page(params[:page])

    @item_kinds = ItemKind.all

    render layout: 'dialog' if params[:mode] == 'dialog'
  end

  def show
    @item = Item.find_by(name: params[:name])
    
    if @item.nil?
      redirect_to items_path(q: {name_cont: params[:name]}), flash: {warning: I18n.t('msg.not_found')}
    end
  end

  def edit
    @item = Item.find_by(name: params[:name])
    
    if @item.nil?
      redirect_to items_path(q: {name_cont: params[:name]}), flash: {warning: I18n.t('msg.not_found')}
    end
  end

  def update
    @item = Item.find_by(name: params[:name])
    
    if @item.nil?
      redirect_to items_path(q: {name_cont: params[:name]}), flash: {warning: I18n.t('msg.not_found')}
    else
      @item.attributes = item_params
      @item.save

      redirect_to item_path(@item)
    end
  end

  private

    def item_params
      params.require(:item).permit(:item_kind_id, :name, :image)
    end
end

