class PortalsController < ApplicationController
  
  def index
    redirect_to mypage_path if current_user.present?
  end
  
  def mypage
    # ログインしていなければ、TOPページに移動
    redirect_to root_url and return unless current_user.present?
    
    @q = Item.search
    @q.sorts = 'name desc' if @q.sorts.empty?
    
    @items = @q.result
    @items = @items.page(params[:page])
  end
  
end
