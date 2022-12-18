class Public::SearchesController < ApplicationController

  def search
    @posts = Post.search(params[:keyword]).page(params[:page]).per(10)
    @keyword = params[:keyword]
    # 業界検索テンプレート用
    @industries = Industry.all
  end

end
