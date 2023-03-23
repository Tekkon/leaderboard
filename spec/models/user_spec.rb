# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user, country: country) }

  let(:country) { create(:country) }

  it { is_expected.to belong_to(:country) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:score) }
end
