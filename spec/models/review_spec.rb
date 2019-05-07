require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'relationship' do
    it {should belong_to :user}
    it {should belong_to :book}
  end
end
