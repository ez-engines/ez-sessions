# frozen_string_literal: true

module Ez
  module Sessions
    module API
      def create_session(user_id:, user_agent: nil, expires_at: nil)
        Ez::Sessions::Model.create!(
          user_id:    user_id,
          user_agent: user_agent,
          expires_at: expires_at || 30.days.from_now
        )
      end

      def encode_token(session_record)
        JWT.encode(
          {
            session_id: session_record.id,
            user_id:    session_record.user_id,
            exp:        session_record.expires_at.to_i
          },
          Ez::Sessions.config.token_secret_base
        )
      end

      def decode_session(session_token)
        payload = JWT.decode(session_token, Ez::Sessions.config.token_secret_base).first
        Ez::Sessions::Model.find_by!(id: payload.fetch('session_id'))
      rescue StandardError
        Ez::Sessions.config.on_invalid_session_token.call
      end
    end
  end
end
