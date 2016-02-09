require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Active Record Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:provider) }
    it { should validate_presence_of(:uid) }
  end

  describe 'Active Record Associations' do
    it { should have_many(:tasks) }
  end
end
