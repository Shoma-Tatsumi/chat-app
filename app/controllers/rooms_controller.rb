class RoomsController < ApplicationController

  def index
  end

  def new
    @room = Room.new #チャットルーム新規作成なのでnewアクション
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy #destroyアクションは、削除するだけなのでビューの表示は必要はありません。そのため、インスタンス変数ではなく変数としてroomを定義し、destroyメソッドを使用します。←コントローラーで定義しても、インスタンス定数を、ビューで使えないからか。
      room = Room.find(params[:id]) #どのチャットルームを削除するのかを特定する場合は、Room.find(params[:id])
      room.destroy
      redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
