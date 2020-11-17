require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'test passwords' do
      # test that @user can be saved
      it 'saves the user with all fields and matching passwords' do
      original_count = User.count
        @user = User.create(
          first_name: 'Michael',
          last_name: 'Schumacher',
          email: 'michael@schumacher.com',
          password: 'greatest',
          password_confirmation: 'greatest'
        )
        # puts "user: #{@user.inspect}"
        expect(User.count).not_to eq(original_count)
      end
      # test that @user cannot be saved with different passwords
      it 'does not save the user with all fields but different passwords' do
        original_count = User.count
          @user = User.create(
            first_name: 'Michael',
            last_name: 'Schumacher',
            email: 'michael@schumacher.com',
            password: 'greatest',
            password_confirmation: 'goat'
          )
          expect(User.count).to eq(original_count)
          # puts "user: #{@user.errors.full_messages}"
          expect(@user.errors.full_messages).to include(
            'Password confirmation doesn\'t match Password')
      end
    end
    
    context 'one at a time' do
      it 'does not save without first_name' do
        @user = User.create(
            # first_name: 'Michael',
            last_name: 'Schumacher',
            email: 'michael@schumacher.com',
            password: 'greatest',
            password_confirmation: 'goat'
          )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('First name can\'t be blank')
      end
      it 'does not save without first_name' do
        @user = User.create(
            last_name: 'Schumacher',
            email: 'michael@schumacher.com',
            password: 'greatest',
            password_confirmation: 'goat'
          )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include(
          'First name can\'t be blank')
      end
      it 'does not save without last_name' do
        @user = User.create(
            first_name: 'Michael',
            email: 'michael@schumacher.com',
            password: 'greatest',
            password_confirmation: 'goat'
          )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include(
          'Last name can\'t be blank')
      end
      it 'does not save without email' do
        @user = User.create(
            first_name: 'Michael',
            last_name: 'Schumacher',
            password: 'greatest',
            password_confirmation: 'goat'
          )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include(
          'Email can\'t be blank')
      end
      it 'does not save without password' do
        @user = User.create(
            first_name: 'Michael',
            last_name: 'Schumacher',
            email: 'michael@schumacher.com',
            password_confirmation: 'goat'
          )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include(
          'Password can\'t be blank')
      end
      it 'does not save without password confirmation' do
        @user = User.create(
            first_name: 'Michael',
            last_name: 'Schumacher',
            email: 'michael@schumacher.com',
            password: 'greatest'
          )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include(
          'Password confirmation can\'t be blank')
      end
    end
    context "email" do
      it "must not exist in the database" do

      end
    end
  end

  describe '.authenticate_with_credentials' do

  end
end
