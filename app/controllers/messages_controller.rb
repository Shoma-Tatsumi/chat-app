class MessagesController < ApplicationController
  def index
    @message = Message.new  # Message Model のインスタンス情報を代入する
    @room = Room.find(params[:room_id]) # paramsに含まれているroom_idを代入する    
  end

    #form_withでビューファイルからコントローラーに値を送信する準備はでき、次は、コントローラー側で、送られてきた値（パラメーター）を受け取り、保存する処理を実装
  def create
    @room = Room.find(params[:room_id]) # room_idから、特定のレコードを取得
    @message = @room.messages.new(message_params) # 親モデルのインスタンス.子モデルの複数形（小文字）.newという記述方法でチャットルームに紐づくメッセージインスタンスを生成し、属性値を指定 
    if @message.save  # インスタンスをメッセージテーブルに保存について yes or no
      redirect_to room_messages_path(@room) #messagesコントローラーのindexアクションに再度リクエストを送信し、新たにインスタンス変数を生成します。これによって保存後の情報に更新されます。
    else
      render :index #indexアクションのindex.html.erbを表示するように指定しています。このとき、indexアクションのインスタンス変数はそのままindex.html.erbに渡され、同じページに戻ります
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id) #ログインしているユーザーidとひも付いているメッセージ内容contentを受け取れるよう許可
  end
end
