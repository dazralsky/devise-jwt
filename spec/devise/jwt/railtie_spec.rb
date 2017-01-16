# frozen_string_literal: true

require 'spec_helper'

describe Devise::JWT::Railtie do
  let(:rails) { Rails }
  let(:rails_config) { Rails.configuration }

  it 'adds JWTAuth middleware' do
    expect(rails_config.middleware).to include(Warden::JWTAuth::Middleware)
  end

  it 'configures as JWTAuth mappings devise modules configured to jwt' do
    expect(Warden::JWTAuth.config.mappings).to eq(
      jwt_user: JwtUser
    )
  end

  it 'configures as dispatch_paths sign_in for modules configured with jwt' do
    expect(Warden::JWTAuth.config.dispatch_paths).to eq(
      Regexp.union('/jwt_users/sign_in')
    )
  end
end