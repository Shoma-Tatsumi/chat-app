class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content ,presence: true #「content」カラムに、presence: trueを設けることで、空の場合はDBに保存しない
end
