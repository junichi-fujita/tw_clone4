class TopsController < ApplicationController
  before_action :set_top, only: [:edit, :update, :destroy]

  def index
    @tops = Top.order(updated_at: :desc).page(params[:page]).per(5)
  end

  def new
    @top = Top.new
  end

  def create
    @top = Top.new(top_params)
    if params[:back]
      render :new
    else
      if @top.save
        redirect_to :tops, notice: "投稿しました。"
      else
        render "new"
      end
    end
  end

  def show

  end

  def edit
  end

  def update
    @top.assign_attributes(top_params)
    if @top.save
      redirect_to :tops, notice: "変更しました。"
    else
      render "edit"
    end
  end

  def destroy
    @top.destroy
    redirect_to :tops, notice: "削除しました。"
  end

  def confirm
    @top = Top.new(top_params)
    @top.id = params[:id]
    if @top.invalid?
      render "new"
    end
   
  end

  private 

  def top_params
    params.require(:top).permit(:content)
  end

  def set_top
    @top = Top.find(params[:id])
  end
end
