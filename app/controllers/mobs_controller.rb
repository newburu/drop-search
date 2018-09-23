class MobsController < InheritedResources::Base

  def index
    @q = Mob.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    
    @mobs = @q.result
    @mobs = @mobs.page(params[:page])

    render layout: 'dialog' if params[:mode] == 'dialog'
  end

  private

    def mob_params
      params.require(:mob).permit(:name, :image)
    end
end

