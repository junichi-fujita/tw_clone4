class TopsController < ApplicationController
  before_action :set_top, only: [:edit]

  def index
    @tops = Top.order(updated_at: :desc)
  end

  def new
    @top = Top.new
  end

  def create
    top = Top.new(top_params)
    if top.save
      redirect_to :new_top
    else
      render "new"
    end
  end

  def show

  end

  def edit
  end

  def update

  end

  def destroy

  end

  private 

  def top_params
    params.require(:top).permit(:content)
  end

  def set_top
    @top = Top.find(params[:id])
  end
end
