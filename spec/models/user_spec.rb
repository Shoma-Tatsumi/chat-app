require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank") 
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank") 
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)") 
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '000000'
      @user.password_confirmation = '0000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save #user情報をデータベースに保存する記述
      another_user = FactoryBot.build(:user, email: @user.email) #FactoryBotを用いて、user情報（name、email、password、password_confirmation）の中でも「email」だけを選択してインスタンスを生成
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end
end
