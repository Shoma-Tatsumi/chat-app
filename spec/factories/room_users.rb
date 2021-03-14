FactoryBot.define do
  factory :room_user do
    association :user #room_userのインスタンスが生成したと同時に、関連するUserのインスタンスも生成されます。
    association :room #room_userのインスタンスが生成したと同時に、関連するRoomのインスタンスも生成されます。
  end
end