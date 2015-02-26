class Admin::LightningTalksController < ApplicationController
  before_action :set_lightning_talk, only:[:show, :edit, :update]
  before_action :check_for_admin

  def index
    @lightning_talks = LightningTalk.all
  end

  def show
    @user = User.find(@lightning_talk.user_id)
  end

  def new
    @lightning_talk = LightningTalk.new
  end

  def create
    @lightning_talk = LightningTalk.new(lightning_talk_params)
    if @lightning_talk
      flash[:notice] = "You have successfully created a lightning talk"
      redirect_to admin_lightning_talks_path
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @lightning_talk.update(lightning_talk_params)
      flash[:notice] = 'You have updated your lightning talk'
      redirect_to admin_lightning_talks_path
    else
      render :edit
    end
  end

  def destroy
    LightningTalk.find(params[:id]).destroy
    flash[:notice] = 'You are too scared to give a lightning talk?'
    redirect_to admin_lightning_talks_path
  end

  private

  def lightning_talk_params
    params.require(:lightning_talk).permit(:user, :description, :date)
  end

  def set_lightning_talk
    @lightning_talk = LightningTalk.find(params[:id])
  end

  def check_for_admin
    unless current_user && current_user.admin
      flash[:notice] = "You do not have permission"
      redirect_to root_path
    end
  end

end
