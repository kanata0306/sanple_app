class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create 
    #でーたを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    #データをセーブ
    list.save
    #トップ画面へリダイレクト
    redirect_to list_path(list.id)
    
  end
    
  
    
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])  
  end

  def edit
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
