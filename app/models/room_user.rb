class RoomUser < ApplicationRecord
  belongs_to :room
  belongs_to :user
   # Room.create(name: "ルーム１", user_ids: [1, 2])とコンソールで出力し、テーブルに追加。モデル名+_idsで所属させていものを配列で指定すると、中間テーブルに保存される。

end
