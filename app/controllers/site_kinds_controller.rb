class SiteKindsController < InheritedResources::Base

  def index
    @q = SiteKind.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    
    @site_kinds = @q.result
    @site_kinds = @site_kinds.page(params[:page])

    render layout: 'dialog' if params[:mode] == 'dialog'
  end

  private

    def site_kind_params
      params.require(:site_kind).permit(:name)
    end
end

