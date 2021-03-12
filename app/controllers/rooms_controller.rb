class RoomsController < ApplicationController
  def new
    @room = Room.new #チャットルーム新規作成なのでnewアクション
  end
end
