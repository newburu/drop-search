class ServerKindsController < InheritedResources::Base

  def index
    @q = ServerKind.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    
    @server_kinds = @q.result
    @server_kinds = @server_kinds.page(params[:page])

    render layout: 'dialog' if params[:mode] == 'dialog'
  end

  private

    def server_kind_params
      params.require(:server_kind).permit(:site_kind_id, :name)
    end
end

