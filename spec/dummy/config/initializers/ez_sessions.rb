# frozen_string_literal: true

Ez::Sessions.configure do |config|
  # Tokens generation secret key
  config.token_secret_base = '945bb7e1c47e9d2aea8ffac044622b56404a6757033b7c5fb6533b7131e1be2a'

  # Modify sessions table name
  # config.sessions_table_name = 'ez_sessions'
end
