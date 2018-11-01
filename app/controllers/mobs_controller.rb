class MobsController < InheritedResources::Base

  def index
    @q = Mob.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    
    @mobs = @q.result
    @mobs = @mobs.page(params[:page])

    render layout: 'dialog' if params[:mode] == 'dialog'
  end

  def show
    @mob = Mob.find_by(name: params[:name])
    
    if @mob.nil?
      redirect_to mobs_path(q: {name_cont: params[:name]}), flash: {warning: I18n.t('msg.not_found')}
    end
  end

 def edit
    @mob = Mob.find_by(name: params[:name])
    
    if @mob.nil?
      redirect_to mobs_path(q: {name_cont: params[:name]}), flash: {warning: I18n.t('msg.not_found')}
    end
  end

  def update
    @mob = Mob.find_by(name: params[:name])
    
    if @mob.nil?
      redirect_to mobs_path(q: {name_cont: params[:name]}), flash: {warning: I18n.t('msg.not_found')}
    else
      @mob.attributes = mob_params
      @mob.save

      redirect_to mob_path(@mob)
    end
  end

  private

    def mob_params
      params.require(:mob).permit(:map_area_id, :name, :image)
    end
end

