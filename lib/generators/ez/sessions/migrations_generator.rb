# frozen_string_literal: true

# rubocop:disable all
module Ez
  module Sessions
    class MigrationsGenerator < Rails::Generators::Base
      def config
        Ez::Sessions.config
      end

      def create_migration
        create_file "db/migrate/#{Time.current.strftime('%Y%m%d%H%M%S')}_create_ez_sessions.rb",
                    "# frozen_string_literal: true

class CreateEzSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :#{config.sessions_table_name} do |t|
      t.integer :user_id, null: false
      t.string :user_agent
      t.datetime :expires_at, null: false
      t.timestamps null: false
    end

    add_index :#{config.sessions_table_name}, :user_id
  end
end
"
      end
    end
  end
end
# rubocop: enable all
