class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content ,presence: true #「content」カラムに、presence: trueを設けることで、空の場合はDBに保存しない
end
