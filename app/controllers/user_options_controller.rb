class UserOptionsController < ApplicationController

  before_action :set_user_option, only: [:show, :edit, :update, :destroy]

  def edit
    
  end

  def create
    @user_option = UserOption.new(user_option_params)
    @user_option.user = current_user
    if @user_option.save
      redirect_to edit_user_option_path(current_user), notice: I18n.t('msg.update.successfully')
    else
      render :edit
    end
  end

  def update
    if @user_option.update(user_option_params)
      redirect_to edit_user_option_path(current_user), notice: I18n.t('msg.update.successfully')
    else
      render :edit
    end
  end

  private
  
    def set_user_option
      @user_option = UserOption.find_or_initialize_by(user: current_user)
    end
  
    def user_option_params
      params.require(:user_option).permit(:server)
    end

end
