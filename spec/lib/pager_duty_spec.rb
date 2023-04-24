# frozen_string_literal: true

require 'spec_helper'

require_relative '../../lib/pager_duty'

RSpec.describe PagerDuty::Client do
  let(:auth_token) { 'y_NbAkKc66ryYTWUXYEu' }
  let(:client) { described_class.new(auth_token) }

  describe '#list_users' do
    context 'when request succeeds' do
      before do
        stub_request(:get, 'https://api.pagerduty.com/users')
          .to_return(
            status: 200,
            body: {
              limit: 1,
              offset: 0,
              total: nil,
              more: true,
              users: [{}, {}, {}]
            }.to_json,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      let(:response) { client.list_users }

      it 'returns limit' do
        expect(response['limit']).to eq(1)
      end

      it 'returns offset' do
        expect(response['offset']).to eq(0)
      end

      it 'returns total' do
        expect(response['total']).to be_nil
      end

      it 'returns users as array' do
        expect(response['users']).to be_a(Array)
      end

      it 'returns 3 users' do
        expect(response['users'].count).to eq(3)
      end
    end

    context 'when request fails' do
      context 'with invalid token' do
        before do
          stub_request(:get, 'https://api.pagerduty.com/users')
            .to_return(
              status: 401,
              body: {
                error: {
                  code: 401,
                  message: 'Authentication token is invalid',
                  errors: ['invalid token']
                }
              }.to_json,
              headers: { 'Content-Type' => 'application/json' }
            )
        end

        it 'raises an ApiError' do
          expect { client.list_users }.to raise_error(
            PagerDuty::ApiError, 'Authentication token is invalid'
          )
        end
      end
    end
  end
end
