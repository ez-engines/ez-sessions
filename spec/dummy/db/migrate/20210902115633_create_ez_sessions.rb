# frozen_string_literal: true

class CreateEzSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :ez_sessions do |t|
      t.integer :user_id, null: false
      t.string :user_agent
      t.datetime :expires_at, null: false
      t.timestamps null: false
    end

    add_index :ez_sessions, :user_id
  end
end
