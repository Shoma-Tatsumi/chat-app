class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image #この記述により、モデル.ファイル名で、添付されたファイルにアクセスできるようになります。また、このファイル名は、そのモデルが紐づいたフォームから送られるパラメーターのキーにもなります。

  validates :content ,presence: true, unless: :was_attached? #「content」カラムに、presence: trueを設けることで、空の場合はDBに保存しない
                                       #↑validatesのunlessオプションにメソッド名を指定することで、「メソッドの返り値がfalseならばバリデーションによる検証を行う」という条件を作っています。
                                       #指定されたwas_attached?メソッドは、self.image.attached?という記述によって、画像があればtrue、なければfalseを返す仕組み
  def was_attached?
    self.image.attached?
  end
end