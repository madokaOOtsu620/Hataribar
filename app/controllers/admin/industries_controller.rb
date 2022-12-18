class Admin::IndustriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @industries = Industry.all
    @industry = Industry.new
  end

  def edit
    @industry = Industry.find(params[:id])
  end

  def update
    @industry = Industry.find(params[:id])
   if @industry.update(industry_params)
      redirect_to admin_industries_path, notice: '業界名を更新しました！'
   else
      render :edit
   end
  end

  def create
    @industry = Industry.new(industry_params)
    if @industry.save
      redirect_to admin_industries_path, notice: '業界を追加しました！'
    else
      @industries = Industry.all
      render :index
    end
  end

  private

  def industry_params
    params.require(:industry).permit(:industry)
  end


end
