require 'rails_helper'

RSpec.describe Doctor, type: :model do
  include Shoulda::Matchers::ActiveModel
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:specialism) }
  end
end