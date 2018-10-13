class MapAreasController < InheritedResources::Base

  def index
    @q = MapArea.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    
    @map_areas = @q.result
    @map_areas = @map_areas.page(params[:page])

    render layout: 'dialog' if params[:mode] == 'dialog'
  end

  private

    def map_area_params
      params.require(:map_area).permit(:name)
    end
end

