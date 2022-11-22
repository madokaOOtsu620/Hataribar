class Public::IndustriesController < ApplicationController

  def show
    @industry = Industry.find(params[:id])
    # 業界検索テンプレート用
    @industries = Industry.all
  end

end
