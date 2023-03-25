# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:country) { create(:country) }

  before do
    country2 = create(:country)
    create_list(:user, 200, country: country)
    create_list(:user, 200, country: country2)
  end

  context 'when default searching' do
    it 'returns top 100 users ordered by score desc' do
      get api_v1_users_path
      expect(response).to have_http_status :ok
      expect(parsed_response).to eq User.order(score: :desc).take(100).as_json
    end
  end

  context 'when search by country' do
    it 'returns 100 users filtered by country and ordered by score desc' do
      get api_v1_users_path, params: { country_id: country.id }
      expect(response).to have_http_status :ok
      expect(parsed_response).to eq(
        User.where(country: country).order(score: :desc).take(100).as_json
      )
    end
  end
end
