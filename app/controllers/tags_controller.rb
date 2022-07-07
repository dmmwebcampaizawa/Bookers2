class TagsController < ApplicationController
  
  #deviseのメソッド。ユーザがログインしているか確認し、ログインしていない場合はログインページにリダイレクト
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if
      @range == "tag_name"
      @books = Book.looks(params[:search], params[:tag_name])
      @tag_name = params[:tag_name]
      render :tag
    else
      render :tag
    end
  end
  
  
end
