class MobMapAreasController < InheritedResources::Base

  def index
    @q = MobMapArea.ransack(params[:q])
    @q.sorts = 'map_area_name asc' if @q.sorts.empty?
    
    @mob_map_areas = @q.result
    @mob_map_areas = @mob_map_areas.page(params[:page])

    render layout: 'dialog' if params[:mode] == 'dialog'
  end

  private

    def mob_map_area_params
      params.require(:mob_map_area).permit(:mob_id, :map_area_id)
    end
end

