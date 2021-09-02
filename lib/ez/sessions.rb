# frozen_string_literal: true

require 'ez/sessions/engine'
require 'ez/sessions/version'
require 'ez/sessions/railtie'
require 'ez/sessions/api'
require 'ez/configurator'

module Ez
  module Sessions
    include Ez::Configurator

    configure do |config|
      config.token_secret_base = 'CHANGE_ME!'
      config.sessions_table_name = 'ez_sessions'
      config.on_invalid_session_token = -> { raise 'Invalid token!' }
    end
  end
end
