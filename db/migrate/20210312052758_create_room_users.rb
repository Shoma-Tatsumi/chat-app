class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      #追加するカラムを記載、中間テーブルなので、別テーブルのカラムから引っ張り出すのに、references を使い、foreign_key: trueは、存在している情報を参照する役割を表す。
      t.references :room, foreign_key: true; 
      t.references :user, foreign_key: true;
      t.timestamps
    end
  end
end
