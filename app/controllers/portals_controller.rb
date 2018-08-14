class PortalsController < ApplicationController
  
  def index
    redirect_to mypage_path if current_user.present?
  end
  
  def mypage
    # ログインしていなければ、TOPページに移動
    redirect_to root_url and return unless current_user.present?
    
    @q = ServerKind.search
    @q.sorts = 'name desc' if @q.sorts.empty?
    
    @server_kinds = @q.result
    @server_kinds = @server_kinds.page(params[:page])
  end
  
end
