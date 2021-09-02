# frozen_string_literal: true

require 'rails_helper'

module Auth
  extend Ez::Sessions::API
end

RSpec.describe Ez::Sessions::API do
  describe '.create_session' do
    context 'with valid params' do
      it 'creates session' do
        result = Auth.create_session(user_id: 1)

        expect(result).to be_persisted
        expect(result).to be_instance_of(Ez::Sessions::Model)
        expect(result.user_id).to eq(1)
        expect(result.user_agent).to eq(nil)
        expect(result.expires_at.to_date).to eq(30.days.from_now.to_date)
      end
    end
  end

  describe '.encode_token' do
    context 'with session object' do
      it 'creates session' do
        session = Ez::Sessions::Model.new(id: 1, user_id: 2, expires_at: 30.days.from_now)
        token = Auth.encode_token(session)

        expect(token).to be_present
        expect(token).to be_instance_of(String)

        decoded_token = JWT.decode(token, Ez::Sessions.config.token_secret_base)
        expect(decoded_token).to eq(
          [
            {
              'session_id' => 1,
              'user_id'    => 2,
              'exp'        => 30.days.from_now.to_i
            },
            {
              'alg' => 'HS256'
            }
          ]
        )
      end
    end
  end

  describe '.decode_session' do
    context 'with valid token' do
      let(:session) { Auth.create_session(user_id: 1) }
      let(:token) { session.token }

      it 'returns session record' do
        expect(Auth.decode_session(token)).to eq session
      end
    end
  end
end
