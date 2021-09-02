# frozen_string_literal: true

module Ez
  module Sessions
    class InstallGenerator < Rails::Generators::Base
      def create_migration
        create_file 'config/initializers/ez_sessions.rb',
                    "# frozen_string_literal: true

Ez::Sessions.configure do |config|
  # Tokens generation secret key
  config.token_secret_base = '#{SecureRandom.hex(32)}'

  # Modify sessions table name
  # config.sessions_table_name = 'ez_sessions'

  # Callback for invalid token case
  # config.on_invalid_session_token = -> { raise 'Invalid token!' }
end
"
      end
    end
  end
end
