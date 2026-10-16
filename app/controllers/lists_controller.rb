class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params) #list変数　newメソッド
    if @list.save #list変数に対してsaveメソッドを呼び出し(dbへの保存)
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id)
    else
      flash[:notice] = "投稿に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @lists = List.all #allメソッド(全てのデータを取得する)
  end

  def show # newアクションでも同名インスタンス変数...
    @list = List.find(params[:id])
    # findメソッド 引数を受け取り、idカラムを引数と比べてレコードを取得
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
