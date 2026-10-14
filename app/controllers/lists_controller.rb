class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    list = List.new(list_params) #list変数　newメソッド
    list.save #list変数に対してsaveメソッドを呼び出し(dbへの保存)
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all #allメソッド(全てのデータを取得する)
  end

  def show # newアクションでも同名インスタンス変数...
    @list = List.find(params[:id])
    # findメソッド 引数を受け取り、idカラムを引数と比べてレコードを取得
  end

  def edit
  end

  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
