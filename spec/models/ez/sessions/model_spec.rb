# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ez::Sessions::Model do
  subject { described_class.create(user_id: 1, user_agent: 'test', expires_at: 30.days.from_now) }

  it { expect(subject).to be_persisted }
  it { expect(subject.user_id).to eq 1 }
  it { expect(subject.user_agent).to eq 'test' }
  it { expect(subject.expires_at.to_date).to eq 30.days.from_now.to_date }

  describe '#token' do
    it 'returns string token' do
      expect(subject.token).to be_present
      expect(subject.token).to be_instance_of(String)
    end
  end
end
