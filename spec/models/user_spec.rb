require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end  

  describe 'ユーザー新規登録' do
    context 'ユーザーが新規登録できる時' do
      it '全ての値が存在すれば登録できること' do
        expect(@user).to be_valid
      end  
    end  
    context 'ユーザーが新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end  
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end  
      it '同じメールアドレスは登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end  
      it '@を含めない場合は登録できないこと' do
        @user.email = 's100.iizuka.masamigmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end  
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end  
      it '半角数字のみでは登録できないこと' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end 
      it '全角英数混合では登録できないこと' do
        @user.password = 'ＡAAAA1'
        @user.password_confirmation = 'ＡAAAA1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaa'
         @user.password_confirmation = 'aaaaaa'
         @user.valid?
         expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
         @user.password = 'a12345'
         @user.password_confirmation = 'a123456'
         @user.valid?
         expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
         @user.last_name = ''
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name can't be blank")
      end  
      it 'last_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
         @user.last_name = '111111'
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name is invalid")
      end  
      it 'first_nameが空では登録できない' do
         @user.first_name = ''
         @user.valid?
         expect(@user.errors.full_messages).to include("First name can't be blank")
      end  
      it 'first_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end  
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end  
      it 'imageが空では登録出来ない' do
        @user.image = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Image can't be blank")
      end  
      it 'position_idが1では登録できない' do
        @user.position_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Position must be other than 1")
      end  
      it 'baseball_history_idが1では登録できない' do
        @user.baseball_history_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Baseball history must be other than 1")
      end
    end  
  end
end
