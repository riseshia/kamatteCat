require 'rails_helper'

RSpec.describe ApiController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(post: '/api').to route_to('api#index', format: 'json')
    end
  end
end
