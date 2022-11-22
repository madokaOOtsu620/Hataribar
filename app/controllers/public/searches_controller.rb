class Public::SearchesController < ApplicationController

  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    # 業界検索テンプレート用
    @industries = Industry.all
  end

#   def search
# 		@model = params[:model]
# 		@content = params[:content]
# 		@method = params[:method]
# 		if @model == 'user'
# 			@records = User.search_for(@content, @method)
# 		else
# 			@records = Book.search_for(@content, @method)
# 		end
# 	end

end
