require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(
      given_name: 'Martin',
      family_name: 'Thompson',
      email: 'test@test.com',
      password: 'asdfasdf',
      password_confirmation: 'asdfasdf'
    )
  end

  context 'with empty given_name' do
    it 'is invalid' do
      user.given_name = nil
      
      except(user).not_to be_valid
    end
  end

  context 'with empty family_name' do
    it 'is invalid' do
      user.family_name = nil
      
      except(user).not_to be_valid
    end
  end

  context 'with an erroneous password' do
    context 'with short password' do
      it 'is invalid' do
        user.password = '1234'
        user.password_confirmation = '1234'

        except(user).not_to be_valid
      end
    end

    context 'with password confirmation' do
      it 'is invalid' do
        user.password_confirmation = ''

        except(user).not_to be_valid
      end
    end

    context 'when passwords dont match' do
      it 'is invalid' do
        user.password_confirmation = '123546'

        except(user).not_to be_valid
      end
    end
  end

  describe '#full_name' do
    it 'should return full name of the user' do
      expect(user.full_name).to eq("#{given_name} #{family_name}")
    end
  end
end
