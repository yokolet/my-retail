require 'rails_helper'

RSpec.describe Api::V1::CurrentPrice, type: :model do
  it { should validate_presence_of(:pid) }
  it { should validate_presence_of(:value) }
  it { should validate_presence_of(:currency_code) }
  it { should validate_uniqueness_of (:pid) }
end
