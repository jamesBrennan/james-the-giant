require 'spec_helper'

describe Authenticator do
  let(:email) { 'lazarus@james-the-giant.com' }
  let(:auth_info) {
    {
        'email' => email,
        'name' => 'Lazarus Valentino',
    }
  }
  let(:auth_data) {
    {
        'uid' => email,
        'info' => auth_info,
    }
  }

  let(:active_session) {
    {
        user_id: email,
        user_data: auth_info
    }
  }
  let(:inactive_session) { {} }
  let(:session) { active_session }
  let(:authenticator) { Authenticator.new(session) }

  describe '#authenticate' do
    let(:session) { active_session }

    context 'with a gmail.com email address' do
      let(:email) { 'lazarus.valentino@gmail.com' }

      it 'returns nil' do
        expect(authenticator.authenticate(auth_data)).to be_nil
      end

      it 'removes user_id from the session' do
        authenticator.authenticate(auth_data)

        expect(active_session[:user_id]).to be_nil
      end

      it 'removes user_data from the session' do
        authenticator.authenticate(auth_data)

        expect(active_session[:user_data]).to be_nil
      end
    end

    context 'with a james-the-giant.com email address' do
      let(:email) { 'lazarus@james-the-giant.com' }

      it 'returns the user data' do
        expect(authenticator.authenticate(auth_data)).to eql(auth_info)
      end

      it 'adds user_id to the session' do
        expect(active_session[:user_id]).to eql(email)
      end

      it 'adds user_data to the session' do
        expect(active_session[:user_data]).to eql(auth_info)
      end
    end
  end

  describe '#load_user' do
    context 'with an active user session' do
      let(:session) { active_session }

      it 'returns the contents of user_data in the session' do
        expect(authenticator.load_user).to eql(auth_info)
      end
    end

    context 'with no active user session' do
      let(:session) { inactive_session }

      it 'returns nil' do
        expect(authenticator.load_user).to be_nil
      end
    end
  end

  describe '#clear_user' do
    let(:session) { active_session }

    it 'clears user_id from the session' do
      authenticator.clear_user

      expect(active_session[:user_id]).to be_nil
    end

    it 'clears user_data from the session' do
      authenticator.clear_user

      expect(active_session[:user_data]).to be_nil
    end
  end
end
