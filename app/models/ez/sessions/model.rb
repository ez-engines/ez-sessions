# frozen_string_literal: true

require 'jwt'

module Ez
  module Sessions
    class Model < ActiveRecord::Base
      include Ez::Sessions::API

      self.table_name = Ez::Sessions.config.sessions_table_name

      def token
        @token ||= encode_token(self)
      end
    end
  end
end
