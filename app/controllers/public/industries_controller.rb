class Public::IndustriesController < ApplicationController

  def show
    @industry = Industry.find(params[:id])
    @posts = @industry.posts.page(params[:page]).per(10)
    # 業界検索テンプレート用
    @industries = Industry.all
  end

end
