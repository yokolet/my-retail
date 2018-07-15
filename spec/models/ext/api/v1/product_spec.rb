require 'rails_helper'

RSpec.describe Ext::Api::V1::Product, type: :model do
  it { should validate_presence_of(:pid) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of (:pid)}
end
